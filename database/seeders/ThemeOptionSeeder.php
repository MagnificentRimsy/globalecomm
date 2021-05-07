<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Setting\Models\Setting as SettingModel;
use Theme;

class ThemeOptionSeeder extends BaseSeeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->uploadFiles('general');

        $theme = Theme::getThemeName();

        SettingModel::where('key', 'LIKE', 'theme-' . $theme . '-%')->delete();

        SettingModel::insertOrIgnore([
            [
                'key'   => 'theme',
                'value' => $theme,
            ],
            [
                'key'   => 'theme-' . $theme . '-site_title',
                'value' => 'HASA Fashion shop',
            ],
            [
                'key'   => 'theme-' . $theme . '-favicon',
                'value' => 'general/favicon.png',
            ],
            [
                'key'   => 'theme-' . $theme . '-logo',
                'value' => 'general/logo.png',
            ],
            [
                'key'   => 'theme-' . $theme . '-seo_og_image',
                'value' => 'general/open-graph-image.png',
            ],
            [
                'key'   => 'theme-' . $theme . '-address',
                'value' => 'North Link Building, 10 Admiralty Street, 757695 Singapore',
            ],
            [
                'key'   => 'theme-' . $theme . '-hotline',
                'value' => '18006268',
            ],
            [
                'key'   => 'theme-' . $theme . '-email',
                'value' => 'sales@botble.com',
            ],
            [
                'key'   => 'theme-' . $theme . '-facebook',
                'value' => 'https://facebook.com',
            ],
            [
                'key'   => 'theme-' . $theme . '-twitter',
                'value' => 'https://twitter.com',
            ],
            [
                'key'   => 'theme-' . $theme . '-youtube',
                'value' => 'https://youtube.com',
            ],
            [
                'key'   => 'theme-' . $theme . '-linkedin',
                'value' => 'https://linkedin.com',
            ],
            [
                'key'   => 'theme-' . $theme . '-pinterest',
                'value' => 'https://pinterest.com',
            ],
            [
                'key'   => 'theme-' . $theme . '-instagram',
                'value' => 'https://instagram.com',
            ],
            [
                'key'   => 'theme-' . $theme . '-homepage_id',
                'value' => '1',
            ],
            [
                'key'   => 'theme-' . $theme . '-blog_page_id',
                'value' => '2',
            ],
            [
                'key'   => 'theme-' . $theme . '-cookie_consent_message',
                'value' => 'Your experience on this site will be improved by allowing cookies ',
            ],
            [
                'key'   => 'theme-' . $theme . '-cookie_consent_learn_more_url',
                'value' => url('cookie-policy'),
            ],
            [
                'key'   => 'theme-' . $theme . '-cookie_consent_learn_more_text',
                'value' => 'Cookie Policy',
            ],
        ]);
    }
}
