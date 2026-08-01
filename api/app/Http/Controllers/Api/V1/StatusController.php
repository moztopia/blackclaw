<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Resources\Api\V1\StatusResource;

final class StatusController extends Controller
{
    public function __invoke(): StatusResource
    {
        return StatusResource::make(now());
    }
}
