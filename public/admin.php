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

// Khởi tạo biến $categories
$categories = [
    'news' => 'Tin nổi bật',
    'latest_news' => 'Tin mới',
    'du_lich_dich_vu' => 'Du Lịch - Dịch Vụ',
    'thong_tin_quy_hoach' => 'Thông Tin Quy Hoạch',
    'cai_cach_hanh_chinh' => 'Cải Cách Hành Chính',
    'pho_bien_phap_luat' => 'Phổ Biến Pháp Luật',
    'thong_tin_tin_tuc' => 'Thông Tin - Tin Tức',
    'van_hoa_xa_hoi' => 'Văn Hóa - Xã Hội',
    'quoc_phong_an_ninh' => 'Quốc Phòng - An Ninh',
    'kinh_te' => 'Kinh Tế'
];

function loadAllNewsContent($adminController) {
    $news = $adminController->getAllNews();
    $stt = 1; // Biến đếm số thứ tự
    ob_start();
?>
<table>
    <thead>
        <tr>
            <th>STT</th>
            <th>Tiêu đề</th>
            <th>URL</th>
            <th>Hình ảnh</th>
            <th>Nội dung</th>
            <th>Ngày đăng</th>
            <th>Hành động</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($news as $item): ?>
        <tr>
            <td><?= $stt++ ?></td> <!-- Số thứ tự -->
            <td><?= htmlspecialchars($item['title']) ?></td>
            <td><?= htmlspecialchars($item['url']) ?></td>
            <td><img src="<?= isset($item['image_url']) ? htmlspecialchars($item['image_url']) : '' ?>" alt="Image"
                    width="100"></td>
            <td class="content-cell"><?= htmlspecialchars($item['content']) ?></td>
            <td><?= isset($item['published_date']) ? $item['published_date'] : '' ?></td>
            <td>
                <div class="action-buttons">
                    <button class="edit-btn" data-id="<?= $item['id'] ?>"
                        data-category="<?= isset($item['category']) ? $item['category'] : '' ?>">Sửa</button>
                    <button class="delete-btn" data-id="<?= $item['id'] ?>"
                        data-category="<?= isset($item['category']) ? $item['category'] : '' ?>">Xóa</button>
                </div>
            </td>
        </tr>
        <?php endforeach; ?>
    </tbody>
</table>
<?php
    return ob_get_clean();
}

// Handle form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'])) {
    switch ($_POST['action']) {
        case 'add':
            $adminController->addNews();
            break;
        case 'edit':
            $adminController->editNews();
            break;
        case 'delete':
            $adminController->deleteNews();
            break;
    }
    header("Location: admin.php");
    exit;
}

// Handle edit action
if (isset($_GET['action']) && isset($_GET['id'])) {
    $id = $_GET['id'];
    if ($_GET['action'] === 'edit') {
        $news = $adminController->getNewsById($id);
        // Đảm bảo rằng bạn lấy nội dung và các thông tin khác
        $editTitle = $news['title'];
        $editContent = $news['content'];
        $editImageUrl = isset($news['image_url']) ? $news['image_url'] : '';
    }
}
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản trị tin tức</title>
    <link rel="stylesheet" href="css/admin.css">
    <script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
</head>

<body>
    <?php include 'admin/sidebar.php'; ?>
    <div class="content">
        <h3>
            <a href="http://localhost/ProjectOJT/public/">Xem trang</a>
        </h3>
        <h2 id=" category-title">Tất cả bài viết</h2>
        <!-- Nút thêm mới -->
        <button id="addNewBtn">Thêm mới</button>
        <!-- Form thêm mới (ẩn đi ban đầu) -->
        <div id="addNewsForm" style="display: none;">
            <form action="admin.php" method="post">
                <input type="hidden" name="action" value="add">
                <label for="title">Tiêu đề:</label>
                <input type="text" id="title" name="title" required>
                <label for="image_url">URL hình ảnh:</label>
                <input type="text" id="image_url" name="image_url" required>
                <label for="content">Nội dung:</label>
                <textarea id="content" name="content" rows="6"></textarea>
                <label for="category">Danh mục:</label>
                <select id="category" name="category" required>
                    <?php foreach ($categories as $key => $value): ?>
                    <option value="<?= htmlspecialchars($key) ?>"><?= htmlspecialchars($value) ?></option>
                    <?php endforeach; ?>
                </select>
                <label for="is_featured">Tin nổi bật:</label>
                <input type="checkbox" id="is_featured" name="is_featured" value="1">
                <button type="submit">Thêm</button>
            </form>
        </div>
        <div id="news-list">
            <?= loadAllNewsContent($adminController) ?>
        </div>
    </div>
    <!-- Modal sửa tin -->
    <div id="editNewsModal" class="modal">
        <div class="modal-overlay">
            <div class="modal-content">
                <span class="close" id="closeEditModal">&times;</span>
                <h3>Chỉnh sửa tin</h3>
                <form action="admin.php" method="post">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" id="editId" name="id">
                    <input type="hidden" id="editCategory" name="category">
                    <label for="editTitle">Tiêu đề:</label>
                    <input type="text" id="editTitle" name="title" required>
                    <label for="editImageUrl">URL hình ảnh:</label>
                    <input type="text" id="editImageUrl" name="image_url">
                    <label for="editContent">Nội dung:</label>
                    <textarea id="editContent" name="content" rows="4"></textarea>
                    <label for="editIsFeatured">Tin nổi bật:</label>
                    <input type="checkbox" id="editIsFeatured" name="is_featured" value="1">
                    <button type="submit">Lưu</button>
                </form>
            </div>
        </div>
    </div>
    <!-- Modal xác nhận xóa -->
    <div id="deleteModal" class="modal">
        <div class="modal-overlay">
            <div class="modal-content">
                <span class="close" id="closeDeleteModal">&times;</span>
                <p>Bạn chắc chắn muốn xóa tin tức này?</p>
                <form action="admin.php" method="post">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" id="deleteId" name="id">
                    <input type="hidden" id="deleteCategory" name="category">
                    <button type="submit">Xóa</button>
                    <button type="button" id="cancelDelete">Hủy</button>
                </form>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/admin.js"></script>
</body>

</html>