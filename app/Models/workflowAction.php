<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class workflowAction extends Model
{
    use HasFactory;

    protected $fillable = [
        'workflow_id',
        'action_type',
        'target_field',
        'value'
    ];
    protected $hidden = [
        'created_at',
        'updated_at'
    ];
}
