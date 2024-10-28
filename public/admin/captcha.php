<?php
session_start();

// Hàm tạo chuỗi Captcha ngẫu nhiên với 3 chữ số và 2 chữ cái được sắp xếp lộn xộn
function generateCaptcha() {
    $digits = '0123456789';
    $letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    
    // Tạo mảng chứa 3 chữ số và 2 chữ cái
    $captchaArray = [];
    
    // Thêm 3 chữ số ngẫu nhiên vào mảng
    for ($i = 0; $i < 3; $i++) {
        $captchaArray[] = $digits[rand(0, strlen($digits) - 1)];
    }
    
    // Thêm 2 chữ cái ngẫu nhiên vào mảng
    for ($i = 0; $i < 2; $i++) {
        $captchaArray[] = $letters[rand(0, strlen($letters) - 1)];
    }
    
    // Trộn ngẫu nhiên các ký tự trong mảng
    shuffle($captchaArray);
    
    // Kết hợp mảng thành chuỗi
    $captcha = implode('', $captchaArray);
    
    return $captcha;
}

$captcha_num = generateCaptcha();
$_SESSION['captcha'] = $captcha_num;

$image = imagecreate(120, 40);

// Tạo màu nền và màu chữ
$background_color = imagecolorallocate($image, 255, 255, 255);
$text_color = imagecolorallocate($image, 0, 0, 0);

// Tạo nhiễu nền
for ($i = 0; $i < 100; $i++) {
    $noise_color = imagecolorallocate($image, 200, 200, 200); // Màu xám nhẹ
    imagesetpixel($image, rand(0, 120), rand(0, 40), $noise_color);
}

// Vẽ các đường kẻ ngẫu nhiên để làm nhiễu
for ($i = 0; $i < 5; $i++) {
    $line_color = imagecolorallocate($image, 150, 150, 150); // Màu xám đậm hơn
    imageline($image, rand(0, 120), rand(0, 40), rand(0, 120), rand(0, 40), $line_color);
}

// Vẽ chuỗi Captcha với màu đen
imagestring($image, 5, 15, 10, $captcha_num, $text_color);

// Hiển thị ảnh
header("Content-type: image/jpeg");
imagejpeg($image);
imagedestroy($image);
?>