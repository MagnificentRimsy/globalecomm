<?php

namespace Botble\Ecommerce\Http\Controllers\Customers;

use App\Http\Controllers\Controller;
use Botble\ACL\Traits\RegistersUsers;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Repositories\Interfaces\CustomerInterface;
use Illuminate\Contracts\Auth\StatefulGuard;
use Illuminate\Support\Facades\Validator;
use Response;
use SeoHelper;
use Theme;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * @var CustomerInterface
     */
    protected $customerRepository;

    /**
     * Create a new controller instance.
     *
     * @param CustomerInterface $customerRepository
     */
    public function __construct(CustomerInterface $customerRepository)
    {
        $this->middleware('customer.guest');
        $this->customerRepository = $customerRepository;
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param array $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        $rules = [
            'name'     => 'required|max:255',
            'email'    => 'required|email|max:255|unique:ec_customers',
            'password' => 'required|min:6|confirmed',
        ];

        if (setting('enable_captcha') && is_plugin_active('captcha')) {
            $rules += ['g-recaptcha-response' => 'required|captcha'];
        }

        return Validator::make($data, $rules);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param array $data
     * @return Customer
     */
    protected function create(array $data)
    {
        return $this->customerRepository->create([
            'name'     => $data['name'],
            'email'    => $data['email'],
            'password' => bcrypt($data['password']),
        ]);
    }

    /**
     * Show the application registration form.
     *
     * @return Response
     */
    public function showRegistrationForm()
    {
        SeoHelper::setTitle(__('Register'));

        Theme::breadcrumb()->add(__('Home'), url('/'))->add(__('Register'), route('customer.register'));

        return Theme::scope('ecommerce.customers.register', [], 'plugins/ecommerce::themes.customers.register')
            ->render();
    }

    /**
     * Get the guard to be used during registration.
     *
     * @return StatefulGuard
     */
    protected function guard()
    {
        return auth('customer');
    }
}
