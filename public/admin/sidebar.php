<!-- /public/sidebar.php -->
<?php

// Lấy full_name từ session
$full_name = isset($_SESSION['full_name']) ? $_SESSION['full_name'] : 'Khách';
?>

<div class="sidebar">
    <h2>Hello, <?= htmlspecialchars($full_name) ?></h2>
    <ul>
        <h2><a href="admin.php">Quản trị website</a></h2>
        <li><a href="edit_welcome_message.php">Thông báo đầu trang</a></li>
        <li><a href="edit_footer.php">Chân trang</a></li>
        <li><a href="admin.php">Bài viết</a></li>
        <li><a href="create_user.php">Tài khoản</a></li>
        <li><a href="documents.php">Văn bản điều hành</a></li>
    </ul>
</div>