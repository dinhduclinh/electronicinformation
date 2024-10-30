<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

require_once '../app/controllers/WelcomeMessageController.php';
require_once '../app/controllers/AdminController.php';

$adminController = new AdminController();
$welcomeController = new WelcomeMessageController($adminController->model->getConnection());

// Kiểm tra và xử lý cập nhật thông báo
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['message'])) {
    $newMessage = $_POST['message'];
    $welcomeController->updateWelcomeMessage($newMessage);
    header("Location: edit_welcome_message.php?success=1");
    exit;
}

// Lấy thông báo hiện tại
$currentMessage = $welcomeController->getWelcomeMessage();
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa thông báo</title>
    <link rel="stylesheet" href="css/admin.css">
</head>

<body>
    <?php include 'admin/sidebar.php'; ?>
    <div class="content">

        <?php if (isset($_GET['success'])): ?>
        <p class="success-message">Cập nhật thành công!</p>
        <?php endif; ?>

        <form action="edit_welcome_message.php" method="post">
            <label for="message">Thông báo đầu trang:</label>
            <textarea id="message" name="message" rows="4"><?= htmlspecialchars($currentMessage) ?></textarea>
            <button type="submit">Cập nhật</button>
        </form>
    </div>
</body>

</html>