<?php
require_once '../app/models/AdminModel.php';
$model = new AdminModel();
$news = null;

if (isset($_GET['slug'])) {
    $slug = $_GET['slug'];
    $news = $model->getNewsBySlug($slug);
}
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo isset($news['title']) ? $news['title'] : 'Không tìm thấy bài viết'; ?></title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/importheader.css">
</head>

<body class="gioithieu-body">

    <?php include '../app/views/header.php'; ?>

    <div class="gioithieu-container">
        <?php
        if ($news) {
    echo "<h1 class='gioithieu-title'>" . htmlspecialchars($news['title']) . "</h1>";
    echo "<div class='gioithieu-text'>" . nl2br($news['content']) . "</div>";
} else {
    echo "<p>Không tìm thấy bài viết.</p>";
}
        ?>
        <a href="http://localhost/ProjectOJT/public/">Trở lại</a>
    </div>

    <?php include '../app/views/footer.php'; ?>
</body>

</html>