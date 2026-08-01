<?php

use App\Http\Controllers\Api\V1\StatusController;
use App\Http\Controllers\Api\V1\WaitlistController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->name('api.v1.')->group(function (): void {
    Route::get('/status', StatusController::class)->name('status');

    Route::post('/waitlist', [WaitlistController::class, 'store'])->name('waitlist.store');
    Route::get('/waitlist/count', [WaitlistController::class, 'count'])->name('waitlist.count');
});
