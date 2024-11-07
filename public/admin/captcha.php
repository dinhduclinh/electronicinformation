<?php
session_start();
function generateCaptcha() {
    $digits = '0123456789';
    $letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    
    $captchaArray = [];
    for ($i = 0; $i < 3; $i++) {
        $captchaArray[] = $digits[rand(0, strlen($digits) - 1)];
    }
    for ($i = 0; $i < 2; $i++) {
        $captchaArray[] = $letters[rand(0, strlen($letters) - 1)];
    }
    shuffle($captchaArray);
    $captcha = implode('', $captchaArray);
    
    return $captcha;
}

$captcha_num = generateCaptcha();
$_SESSION['captcha'] = $captcha_num;

$image = imagecreate(120, 40);

$background_color = imagecolorallocate($image, 255, 255, 255);
$text_color = imagecolorallocate($image, 0, 0, 0);

for ($i = 0; $i < 100; $i++) {
    $noise_color = imagecolorallocate($image, 200, 200, 200);
    imagesetpixel($image, rand(0, 120), rand(0, 40), $noise_color);
}

for ($i = 0; $i < 5; $i++) {
    $line_color = imagecolorallocate($image, 150, 150, 150); 
    imageline($image, rand(0, 120), rand(0, 40), rand(0, 120), rand(0, 40), $line_color);
}

imagestring($image, 5, 15, 10, $captcha_num, $text_color);

header("Content-type: image/jpeg");
imagejpeg($image);
imagedestroy($image);
?>