<?php
$password = '123';

$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

echo 'Mật khẩu đã mã hóa: ' . $hashedPassword;