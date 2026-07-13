<?php

namespace App\Repositories;

use App\Models\Page;
use Illuminate\Support\Str;

class PageRepository extends Repository
{

    protected string $modelClass = Page::class;


    public function all()
    {
        return $this->remember(function (){
            return $this->model()->get();
        });
    }

    public function current(){
        $currentPath = ltrim(request()->path(),'/');
        $currentPath = $currentPath?:"/";
        return $this->all()->where('uri',$currentPath)->first();
    }


}