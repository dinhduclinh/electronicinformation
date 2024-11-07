<?php
require_once '../app/controllers/FooterController.php';
require_once '../app/controllers/AdminController.php';

$adminController = new AdminController();
$footerController = new FooterController($adminController->model->getConnection());

$footerContent = $footerController->getFooter();
?>

<footer>
    <p id="footerContent">
        <?= isset($footerContent['content']) ? htmlspecialchars($footerContent['content']) : '© 2024 Ninh Bình News' ?>
    </p>
</footer>

<script>
var footerContent = document.getElementById('footerContent').innerHTML;
footerContent = footerContent.replace(/<[^>]+>/g, ''); // Loại bỏ tất cả các thẻ HTML
footerContent = footerContent.replace(/&nbsp;/g, ' '); // Thay thế &nbsp; bằng khoảng trắng
document.getElementById('footerContent').innerText = footerContent;
</script>