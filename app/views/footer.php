<?php
require_once '../app/controllers/FooterController.php';
require_once '../app/controllers/AdminController.php';

$adminController = new AdminController();
$footerController = new FooterController($adminController->model->getConnection());

$footerContent = $footerController->getFooter();
?>

<footer>
    <p id="footerContent">
        <?php 
        if (isset($footerContent['content'])) {
            echo nl2br($footerContent['content']);
        } else {
            echo '© 2024 Ninh Bình News';
        }
        ?>
    </p>
</footer>