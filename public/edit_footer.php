<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: admin/login.php');
    exit;
}

require_once '../app/controllers/AdminController.php';
require_once '../app/controllers/FooterController.php';

$adminController = new AdminController();
$footerController = new FooterController($adminController->model->getConnection());

// Handle form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'])) {
    if ($_POST['action'] === 'update_footer') {
        $footerContent = $_POST['footer_content'];
        $result = $footerController->updateFooter($footerContent);
        if ($result) {
            echo "Cập nhật thành công!";
        } else {
            echo "Cập nhật thất bại!";
        }
        exit;
    }
}

$footerContent = $footerController->getFooter();
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa chân trang</title>
    <link rel="stylesheet" href="css/admin.css">
    <script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
</head>

<body>
    <?php include 'admin/sidebar.php'; ?>
    <div class="content">
        <h2>Chỉnh sửa chân trang</h2>
        <form id="editFooterForm" action="edit_footer.php" method="post">
            <input type="hidden" name="action" value="update_footer">
            <label for="footer_content">Nội dung chân trang:</label>
            <textarea id="footer_content" name="footer_content"
                rows="10"><?= isset($footerContent['content']) ? htmlspecialchars($footerContent['content']) : '' ?></textarea>
            <button type="submit">Lưu</button>
        </form>
        <div id="updateMessage"></div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/admin.js"></script>
    <script>
    ClassicEditor
        .create(document.querySelector('#footer_content'))
        .catch(error => {
            console.error(error);
        });

    $('#editFooterForm').on('submit', function(event) {
        event.preventDefault();
        var formData = $(this).serialize();
        $.ajax({
            url: 'edit_footer.php',
            type: 'POST',
            data: formData,
            success: function(response) {
                $('#updateMessage').html(response);
            }
        });
    });
    </script>
</body>

</html>