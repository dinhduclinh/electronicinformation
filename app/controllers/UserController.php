<?php
require_once __DIR__ . '/../models/UserModel.php';

class UserController {
    public function createUser() {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $full_name = $_POST['full_name'];
        $email = $_POST['email'];

        $userModel = new UserModel();
        $result = $userModel->createUser($username, $password, $full_name, $email);

        if ($result) {
            $_SESSION['success_message'] = 'Tài khoản đã được tạo thành công!';
        } else {
            $_SESSION['error_message'] = 'Có lỗi xảy ra khi tạo tài khoản.';
        }

        header('Location: create_user.php');
    }
    public function getAllUsers() {
        $userModel = new UserModel();
        return $userModel->getAllUsers();
    }
}
?>