<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        if (blank(config('app.name'))) {
            throw new \RuntimeException(
                'APP_NAME is not configured. Run `make setup` before starting the application.'
            );
        }
    }
}
