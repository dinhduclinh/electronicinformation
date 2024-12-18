<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '../../../app/models/UserModel.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $captcha = $_POST['captcha'];

    if (!isset($_SESSION['captcha']) || $_SESSION['captcha'] != $captcha) {
        $_SESSION['error'] = 'Mã Captcha không đúng!';
        header('Location: login.php');
        exit;
    }

    $userModel = new UserModel();
    $user = $userModel->getUserByUsername($username);

    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['full_name'] = $user['full_name']; 
        header('Location: ../admin.php');
    } else {
        $_SESSION['error'] = 'Tên đăng nhập hoặc mật khẩu không đúng!';
        header('Location: login.php');
    }
}
?>