<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Workflow extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'trigger_type'
    ];
    protected $hidden = [
        'created_at',
        'updated_at'
    ];

    public function condition(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(WorkflowCondition::class);
    }

    public function action(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(workflowAction::class);
    }

    public function log(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(HistoryLog::class);
    }
}
