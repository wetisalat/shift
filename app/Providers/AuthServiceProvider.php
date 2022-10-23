<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;

use Illuminate\Auth\Notifications\VerifyEmail;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Auth\Notifications\ResetPassword;

use Illuminate\Support\Facades\URL;
use Carbon\Carbon;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        // 'App\Models\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        /*VerifyEmail::createUrlUsing(function ($notifiable) {
            $params = [
                "expires" => Carbon::now()
                  ->addMinutes(60)
                  ->getTimestamp(),
                "id" => $notifiable->getKey(),
                "hash" => sha1($notifiable->getEmailForVerification()),
              ];
        
              ksort($params);
        
              // then create API url for verification. my API have `/api` prefix,
              // so I don't want to show that url to users
              $url = \URL::route("verification.verify", $params, true);
        
              // get APP_KEY from config and create signature
              $key = config("app.key");
              $params['signature'] = hash_hmac("sha256", $url, $key);
              
              // Construct verify url
              $verifyUrl = url("verify-email") . "?expires=" . $params['expires'] . '&id=' . $params['id'] . 
                '&hash=' .$params['hash'] . '&signature=' . $params['signature'] ;
              
              return $verifyUrl;
        });*/

        VerifyEmail::toMailUsing(function ($notifiable, $url) {
            \Log::info('VerifyEmail ---> ' . $url);

            return (new MailMessage)->view(
                'emails.verify', ['url' => $url]
            );
        });  
        
        ResetPassword::createUrlUsing(function ($user, string $token) {
            \Log::info('ResetPassword ---> ' . url('reset-password').'?token='.$token);
            return url('reset-password').'?token='.$token;
        });

        ResetPassword::toMailUsing(function ($notifiable, $token) {
            return (new MailMessage)->view(
                'emails.reset-password', ['url' => url('reset-password').'?token='.$token]
            );
        }); 
    }
}
