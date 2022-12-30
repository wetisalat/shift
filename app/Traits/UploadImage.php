<?php

/**
 * Created by PhpStorm.
 * User: Shehzad
 * Date: 3/23/2020
 * Time: 4:25 AM
 */

namespace App\Traits;

use Storage;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;

trait UploadImage {

    public function uploadImage($image, $dir, $dbField = null) {
        $dbField = $dbField ?? $image;

        if (request()->hasFile($image) && request()->file($image)->isValid()) {
            /* Remove old image if present */
            if ($this->{$dbField} && file_exists($this->{$dbField}))
                unlink(public_path($this->{$dbField}));

            $path = NULL;
            $path = request()->{$image}->store($dir, 'public');

            $this->update([$dbField => "storage/$path"]);
        }
    }
}
