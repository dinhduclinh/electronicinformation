<?php
// Nhập mật khẩu bạn muốn mã hóa
$password = '123';

// Mã hóa mật khẩu bằng password_hash()
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

// In ra mật khẩu đã được mã hóa
echo 'Mật khẩu đã mã hóa: ' . $hashedPassword;