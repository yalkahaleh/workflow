<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistoryLog extends Model
{
    use HasFactory;

    protected $fillable = [
        'workflow_id',
        'status',
        'error_message',
        'effected_rows'
    ];
    protected $hidden = [
        'updated_at'
    ];


}
