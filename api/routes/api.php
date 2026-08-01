<?php

use App\Http\Controllers\Api\V1\CharacterController;
use App\Http\Controllers\Api\V1\CollectionController;
use App\Http\Controllers\Api\V1\StatusController;
use App\Http\Controllers\Api\V1\WaitlistController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->name('api.v1.')->group(function (): void {
    Route::get('/status', StatusController::class)->name('status');

    Route::post('/waitlist', [WaitlistController::class, 'store'])->name('waitlist.store');
    Route::get('/waitlist/count', [WaitlistController::class, 'count'])->name('waitlist.count');

    Route::get('/games/{gameId}/collections', [CollectionController::class, 'index']);
    Route::get('/games/{gameId}/collections/{collectionId}/records', [CollectionController::class, 'records']);
    Route::get('/games/{gameId}/collections/{collectionId}/records/{recordId}', [CollectionController::class, 'show']);
    Route::get('/games/eq2/characters', [CharacterController::class, 'index']);
    Route::get('/games/eq2/characters/{characterId}', [CharacterController::class, 'show']);
});
