<?php
$imageDir = 'D:/wampserver/www/ProjectOJT/img/';
$images = glob($imageDir . '*.{jpg,jpeg,png,gif}', GLOB_BRACE);

$imageList = [];
foreach ($images as $image) {
    $imageList[] = [
        'url' => 'http://localhost/ProjectOJT/img/' . basename($image),
        'name' => basename($image)
    ];
}

header('Content-Type: application/json');
echo json_encode($imageList);
?>