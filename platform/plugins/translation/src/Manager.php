<?php

namespace Botble\Translation;

use Botble\Translation\Models\Translation;
use Exception;
use Illuminate\Events\Dispatcher;
use Illuminate\Filesystem\Filesystem;
use Illuminate\Foundation\Application;
use Illuminate\Support\Arr;
use Illuminate\Support\ServiceProvider;
use Lang;
use League\Flysystem\Adapter\Local as LocalAdapter;
use League\Flysystem\Filesystem as Flysystem;
use League\Flysystem\MountManager;
use Symfony\Component\VarExporter\VarExporter;

class Manager
{
    const JSON_GROUP = '_json';

    /**
     * @var \Illuminate\Foundation\Application
     */
    protected $app;

    /**
     * @var \Illuminate\Filesystem\Filesystem
     */
    protected $files;

    /**
     * @var \Illuminate\Events\Dispatcher
     */
    protected $events;

    /**
     * @var array|\ArrayAccess
     */
    protected $config;

    /**
     * Manager constructor.
     * @param Application $app
     * @param Filesystem $files
     * @param Dispatcher $events
     */
    public function __construct(Application $app, Filesystem $files, Dispatcher $events)
    {
        $this->app = $app;
        $this->files = $files;
        $this->events = $events;
        $this->config = $app['config']['plugins.translation.general'];
    }

    /**
     * @param string $group
     * @param string $key
     */
    public function missingKey($group, $key)
    {
        if (!in_array($group, $this->config['exclude_groups'])) {
            Translation::firstOrCreate([
                'locale' => $this->app['config']['app.locale'],
                'group'  => $group,
                'key'    => $key,
            ]);
        }
    }

    /**
     * @param bool $replace
     * @return int
     */
    public function importTranslations($replace = false)
    {
        try {
            $this->publishLocales();
        } catch (Exception $exception) {
            info($exception->getMessage());
        }

        $counter = 0;

        foreach ($this->files->directories($this->app['path.lang']) as $langPath) {
            $locale = basename($langPath);
            foreach ($this->files->allfiles($langPath) as $file) {
                $info = pathinfo($file);
                $group = $info['filename'];
                if (in_array($group, $this->config['exclude_groups'])) {
                    continue;
                }
                $subLangPath = str_replace($langPath . DIRECTORY_SEPARATOR, '', $info['dirname']);
                $subLangPath = str_replace(DIRECTORY_SEPARATOR, '/', $subLangPath);
                $langDirectory = $group;
                if ($subLangPath != $langPath) {
                    $langDirectory = $subLangPath . '/' . $group;
                    $group = substr($subLangPath, 0, -3) . '/' . $group;
                }

                $translations = Lang::getLoader()->load($locale, $langDirectory);
                if ($translations && is_array($translations)) {
                    foreach (Arr::dot($translations) as $key => $value) {
                        $importedTranslation = $this->importTranslation($key, $value,
                            ($locale != 'vendor' ? $locale : substr($subLangPath, -2)), $group, $replace);
                        $counter += $importedTranslation ? 1 : 0;
                    }
                }
            }
        }

        foreach ($this->files->files($this->app['path.lang']) as $jsonTranslationFile) {
            if (strpos($jsonTranslationFile, '.json') === false) {
                continue;
            }
            $locale = basename($jsonTranslationFile, '.json');
            $group = self::JSON_GROUP;
            $translations = Lang::getLoader()->load($locale, '*',
                '*'); // Retrieves JSON entries of the given locale only
            if ($translations && is_array($translations)) {
                foreach ($translations as $key => $value) {
                    $importedTranslation = $this->importTranslation($key, $value, $locale, $group, $replace);
                    $counter += $importedTranslation ? 1 : 0;
                }
            }
        }

        return $counter;
    }

    /**
     * @param string $key
     * @param string $value
     * @param string $locale
     * @param string $group
     * @param bool $replace
     * @return bool
     */
    public function importTranslation($key, $value, $locale, $group, $replace = false)
    {
        // process only string values
        if (is_array($value)) {
            return false;
        }
        $value = (string)$value;
        $translation = Translation::firstOrNew([
            'locale' => $locale,
            'group'  => $group,
            'key'    => $key,
        ]);

        // Check if the database is different then the files
        $newStatus = $translation->value === $value ? Translation::STATUS_SAVED : Translation::STATUS_CHANGED;
        if ($newStatus !== (int)$translation->status) {
            $translation->status = $newStatus;
        }

        // Only replace when empty, or explicitly told so
        if ($replace || !$translation->value) {
            $translation->value = $value;
        }

        $translation->save();

        return true;
    }

    public function publishLocales()
    {
        $paths = ServiceProvider::pathsToPublish(null, 'cms-lang');

        foreach ($paths as $from => $to) {
            if ($this->files->isFile($from)) {
                if (!$this->files->isDirectory(dirname($to))) {
                    $this->files->makeDirectory(dirname($to), 0755, true);
                }
                $this->files->copy($from, $to);
            } elseif ($this->files->isDirectory($from)) {
                $manager = new MountManager([
                    'from' => new Flysystem(new LocalAdapter($from)),
                    'to'   => new Flysystem(new LocalAdapter($to)),
                ]);

                foreach ($manager->listContents('from://', true) as $file) {
                    if ($file['type'] === 'file') {
                        $manager->put('to://' . $file['path'], $manager->read('from://' . $file['path']));
                    }
                }
            }
        }
    }

    /**
     * @param null $group
     * @param bool $json
     * @throws \Symfony\Component\VarExporter\Exception\ExceptionInterface
     */
    public function exportTranslations($group = null, $json = false)
    {
        if (!empty($group) && !$json) {
            if (!in_array($group, $this->config['exclude_groups'])) {
                if ($group == '*') {
                    return $this->exportAllTranslations();
                }

                $tree = $this->makeTree(Translation::ofTranslatedGroup($group)->orderByGroupKeys(Arr::get($this->config,
                    'sort_keys', false))->get());

                foreach ($tree as $locale => $groups) {
                    if (isset($groups[$group])) {
                        $translations = $groups[$group];
                        $file = $locale . '/' . $group;
                        $groups = explode('/', $group);
                        if (count($groups) > 1) {
                            $folderName = Arr::last($groups);
                            Arr::forget($groups, count($groups) - 1);

                            $dir = 'vendor/' . implode('/', $groups) . '/' . $locale;
                            if (!$this->files->isDirectory($this->app->langPath() . '/' . $dir)) {
                                $this->files->makeDirectory($this->app->langPath() . '/' . $dir, 755, true);
                                system('find ' . $this->app->langPath() . '/' . $dir . ' -type d -exec chmod 755 {} \;');
                            }
                            $file = $dir . '/' . $folderName;
                        }
                        $path = $this->app['path.lang'] . '/' . $file . '.php';
                        $output = "<?php\n\nreturn " . VarExporter::export($translations) . ";\n";
                        $this->files->put($path, $output);
                    }
                }
                Translation::ofTranslatedGroup($group)->update(['status' => Translation::STATUS_SAVED]);
            }
        }

        if ($json) {
            $tree = $this->makeTree(Translation::ofTranslatedGroup(self::JSON_GROUP)->orderByGroupKeys(Arr::get($this->config,
                'sort_keys', false))->get(), true);

            foreach ($tree as $locale => $groups) {
                if (isset($groups[self::JSON_GROUP])) {
                    $translations = $groups[self::JSON_GROUP];
                    $path = $this->app['path.lang'] . '/' . $locale . '.json';
                    $output = json_encode($translations, JSON_PRETTY_PRINT);
                    $this->files->put($path, $output);
                }
            }

            Translation::ofTranslatedGroup(self::JSON_GROUP)->update(['status' => Translation::STATUS_SAVED]);
        }
    }

    /**
     * @return bool
     * @throws \Symfony\Component\VarExporter\Exception\ExceptionInterface
     */
    public function exportAllTranslations()
    {
        $groups = Translation::whereNotNull('value')->selectDistinctGroup()->get('group');

        foreach ($groups as $group) {
            if ($group == self::JSON_GROUP) {
                $this->exportTranslations(null, true);
            } else {
                $this->exportTranslations($group->group);
            }
        }
        return true;
    }

    /**
     * @param array $translations
     * @param bool $json
     * @return array
     */
    protected function makeTree($translations, $json = false)
    {
        $array = [];
        foreach ($translations as $translation) {
            if ($json) {
                $this->jsonSet($array[$translation->locale][$translation->group], $translation->key,
                    $translation->value);
            } else {
                Arr::set($array[$translation->locale][$translation->group], $translation->key, $translation->value);
            }
        }

        return $array;
    }

    /**
     * @param array $array
     * @param string $key
     * @param string $value
     * @return mixed
     */
    public function jsonSet(&$array, $key, $value)
    {
        if (empty($key)) {
            return $array = $value;
        }

        $array[$key] = $value;

        return $array;
    }

    /**
     * @throws Exception
     */
    public function cleanTranslations()
    {
        Translation::whereNull('value')->delete();
    }

    public function truncateTranslations()
    {
        Translation::truncate();
    }

    /**
     * @param null|string $key
     * @return mixed
     */
    public function getConfig($key = null)
    {
        if ($key == null) {
            return $this->config;
        }

        return $this->config[$key];
    }
}
