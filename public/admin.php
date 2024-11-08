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


function loadAllNewsContent($adminController) {
    $news = $adminController->getAllNews();
    $stt = 1; 
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
            <th>Trích dẫn</th>
            <th>Ngày đăng</th>
            <th>Tin nổi bật</th>
            <th>Hành động</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($news as $item): ?>
        <tr data-category="<?= isset($item['category']) ? $item['category'] : '' ?>">
            <td><?= $stt++ ?></td>
            <td><?= htmlspecialchars($item['title']) ?></td>
            <td><?= htmlspecialchars($item['url']) ?></td>
            <td><img src="<?= isset($item['image_url']) ? htmlspecialchars($item['image_url']) : '' ?>" alt="Image"
                    width="100"></td>
            <td class="content-cell"><?= htmlspecialchars($item['content']) ?></td>
            <td class="excerpt-cell"><?= htmlspecialchars($item['excerpt']) ?></td>
            <td><?= isset($item['published_date']) ? $item['published_date'] : '' ?></td>
            <td><?= $item['is_featured'] ? 'Có' : 'Không' ?></td>
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


if (isset($_GET['action']) && isset($_GET['id'])) {
    $id = $_GET['id'];
    if ($_GET['action'] === 'edit') {
        $news = $adminController->getNewsById($id);
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
    <title>Quản trị</title>
    <link rel="stylesheet" href="css/admin.css">
    <script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
    <script src="js/admin.js"></script>
</head>

<body>
    <?php include 'admin/sidebar.php'; ?>
    <div class="content">
        <h3>
            <a href="http://localhost/ProjectOJT/public/">Xem trang</a>
        </h3>
        <h2 id="category-title">Tất cả bài viết</h2>

        <div>
            <label for="searchInput">Tìm kiếm:</label>
            <input type="text" id="searchInput" placeholder="Nhập từ khóa...">
            <label for="categoryFilter">Lọc:</label>
            <select id="categoryFilter">
                <option value="all">Tất cả</option>
                <?php foreach ($categories as $key => $value): ?>
                <option value="<?= htmlspecialchars($key) ?>"><?= htmlspecialchars($value) ?></option>
                <?php endforeach; ?>
            </select>
        </div>

        <div id="news-list">
            <?= loadAllNewsContent($adminController) ?>
        </div>
    </div>

    <div id="editNewsModal" class="modal">
        <div class="modal-overlay">
            <div class="modal-content">
                <span class="close" id="closeEditModal">&times;</span>
                <h3>Chỉnh sửa tin</h3>
                <form action="admin.php" method="post">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" id="editId" name="id">
                    <input type="hidden" id="oldCategory" name="oldCategory">
                    <label for="editTitle">Tiêu đề:</label>
                    <input type="text" id="editTitle" name="title" required>
                    <label for="editImageUrl">Hình ảnh:</label>
                    <button type="button" id="editUploadImageBtn">Chọn Hình Ảnh</button>
                    <input type="text" id="editImageUrl" name="image_url">
                    <label for="editExcerpt">Trích dẫn:</label>
                    <textarea id="editExcerpt" name="excerpt" rows="4"></textarea>
                    <label for="editContent">Nội dung:</label>
                    <textarea id="editContent" name="content" rows="4"></textarea>
                    <label for="editCategory">Danh mục:</label>
                    <select id="editCategory" name="category" required>
                        <?php foreach ($categories as $key => $value): ?>
                        <option value="<?= htmlspecialchars($key) ?>"><?= htmlspecialchars($value) ?></option>
                        <?php endforeach; ?>
                    </select>
                    <label for="editIsFeatured">Tin nổi bật:</label>
                    <input type="checkbox" id="editIsFeatured" name="is_featured" value="true">
                    <button type="submit">Lưu</button>
                </form>
            </div>
        </div>
    </div>

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
    <script src="js/admin.js"></script>
</body>

</html>