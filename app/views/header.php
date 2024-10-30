<?php
// Yêu cầu file Database để tạo kết nối
require_once __DIR__ . '/../../config/database.php';
require_once __DIR__ . '/../controllers/WelcomeMessageController.php';

// Tạo kết nối cơ sở dữ liệu
$database = new Database();
$dbConnection = $database->getConnection();

// Khởi tạo WelcomeMessageController với kết nối cơ sở dữ liệu
$welcomeController = new WelcomeMessageController($dbConnection);

// Lấy thông báo chào mừng từ cơ sở dữ liệu
$welcomeMessage = $welcomeController->getWelcomeMessage();
?>
<header>
    <div class="header-banner">
        <img src="../img/header.gif" alt="Header Banner">
    </div>
    <nav class="navbar">
        <ul>
            <li><a href="http://localhost/ProjectOJT/public/">Trang chủ</a></li>
            <li><a href="gioithieu.php">Giới thiệu</a></li>
            <li><a href="#">Tin tức - Sự kiện</a></li>
            <li><a href="#">Công khai</a></li>
            <li><a href="https://dichvucong.ninhbinh.gov.vn/">Dịch vụ công</a></li>
            <li class="dropdown">
                <a class="dropbtn">Liên hệ - Góp ý</a>
                <div class="dropdown-content">
                    <a href="lienhe.php">Liên hệ</a>
                    <div class="divider"></div> <!-- Thêm ngăn cách -->
                    <a href="admin/login.php">Quản trị</a>
                </div>
            </li>
        </ul>
    </nav>
    <div class="welcome-message">
        <span><?= htmlspecialchars($welcomeMessage) ?></span>
    </div>
</header>