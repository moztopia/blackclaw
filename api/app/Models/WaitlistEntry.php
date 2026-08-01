<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

final class WaitlistEntry extends Model
{
    protected $table = 'waitlist';

    protected $fillable = [
        'name',
        'email',
        'what_for',
        'country_code',
        'phone',
    ];
}
