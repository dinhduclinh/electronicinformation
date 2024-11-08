<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: admin/login.php');
    exit;
}

require_once '../app/controllers/AdminController.php';
$adminController = new AdminController();

$categoriesFromDB = $adminController->getAllCategories();
$categoryMap = [];
foreach ($categoriesFromDB as $category) {
    $categoryMap[$category['id']] = $category['name'];
}

$categories = [
    'latest_news' => $categoryMap[1],
    'du_lich_dich_vu' => $categoryMap[2],
    'thong_tin_quy_hoach' => $categoryMap[3],
    'cai_cach_hanh_chinh' => $categoryMap[4],
    'pho_bien_phap_luat' => $categoryMap[5],
    'thong_tin_tin_tuc' => $categoryMap[6],
    'van_hoa_xa_hoi' => $categoryMap[7],
    'quoc_phong_an_ninh' => $categoryMap[8],
    'kinh_te' => $categoryMap[9],
];

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'add') {
    $adminController->addNews();
    header("Location: admin.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm mới tin tức</title>
    <link rel="stylesheet" href="css/admin.css">
    <script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
</head>

<body>
    <?php include 'admin/sidebar.php'; ?>
    <div class="content">
        <h2>Thêm mới tin tức</h2>
        <form action="Addnews.php" method="post">
            <input type="hidden" name="action" value="add"><br>
            <label for="is_featured">Tin nổi bật</label>
            <input type="checkbox" id="is_featured" name="is_featured" value="true"><br><br>
            <label for="title">Tiêu đề:</label>
            <input type="text" id="title" name="title" required>
            <label for="image_url">Hình ảnh:</label>
            <button type="button" id="uploadImageBtn">Chọn Hình Ảnh</button>
            <input type="text" id="image_url" name="image_url" required>
            <label for="excerpt">Trích dẫn:</label>
            <textarea id="excerpt" name="excerpt" rows="4"></textarea>
            <label for="content">Nội dung:</label>
            <textarea id="content" name="content" rows="6"></textarea>
            <label for="category">Danh mục:</label>
            <select id="category" name="category" required>
                <?php foreach ($categories as $key => $value): ?>
                <option value="<?= htmlspecialchars($key) ?>"><?= htmlspecialchars($value) ?></option>
                <?php endforeach; ?>
            </select>
            <button type="submit">Thêm</button>
        </form>
    </div>
    <div id="imageModal" class="modal">
        <div class="modal-overlay">
            <div class="modal-content">
                <span class="close" id="closeImageModal">&times;</span>
                <h3>Tất cả hình ảnh</h3>
                <div id="imageList"></div>
                <button type="button" id="uploadNewImageBtn">Thêm mới</button>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/addnews.js"></script>
</body>

</html>