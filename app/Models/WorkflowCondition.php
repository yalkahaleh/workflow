<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WorkflowCondition extends Model
{
    use HasFactory;

    protected $fillable = [
        'workflow_id',
        'field',
        'operation',
        'value'
    ];
    protected $hidden = [
        'created_at',
        'updated_at'
    ];
}
