<!-- /public/index.php -->
<?php
require_once '../config/database.php';
require_once '../app/controllers/NewsController.php';

$controller = new NewsController();
$controller->index();
?>