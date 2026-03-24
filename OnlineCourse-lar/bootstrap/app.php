<?php

use App\Http\Middleware\AdminMiddleware;
use App\Http\Middleware\CheckIfAdminAndInst;
use App\Http\Middleware\IfExpired;
use App\Http\Middleware\IfLoggedIn;
use App\Http\Middleware\IfSubscribe;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Foundation\Http\Middleware\ValidateCsrfToken;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        apiPrefix:'api',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware){
        $middleware->validateCsrfTokens(except:[
            'api/*',
        ]);
        $middleware->alias([
            'admin'=>AdminMiddleware::class,
            'AdminAndInst'=>CheckIfAdminAndInst::class,
            'subscribe'=>IfSubscribe::class,
            'expired'=>IfExpired::class,
            'isLoggedin'=>IfLoggedIn::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        //
    })->create();
