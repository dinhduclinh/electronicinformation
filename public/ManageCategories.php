<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: admin/login.php');
    exit;
}

require_once '../app/controllers/AdminController.php';
$adminController = new AdminController();

// Lấy danh sách các danh mục
$categories = $adminController->getAllCategories();

// Xử lý yêu cầu sửa tên danh mục
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'editCategory') {
    $adminController->editCategory($_POST['id'], $_POST['name']);
    header("Location: ManageCategories.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chuyên mục</title>
    <link rel="stylesheet" href="css/admin.css">
</head>

<body>
    <?php include 'admin/sidebar.php'; ?>
    <div class="content">
        <h2>Chuyên mục</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tiêu đề</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($categories as $category): ?>
                <tr>
                    <td><?= htmlspecialchars($category['id']) ?></td>
                    <td><?= htmlspecialchars($category['name']) ?></td>
                    <td>
                        <div class="action-buttons">
                            <button class="edit-category-btn" data-id="<?= htmlspecialchars($category['id']) ?>"
                                data-name="<?= htmlspecialchars($category['name']) ?>">Edit</button>
                        </div>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

    <!-- Modal sửa danh mục -->
    <div id="editCategoryModal" class="modal">
        <div class="modal-overlay">
            <div class="modal-content">
                <span class="close" id="closeEditCategoryModal">&times;</span>
                <h3>Chỉnh sửa danh mục</h3>
                <form action="ManageCategories" method="post">
                    <input type="hidden" name="action" value="editCategory">
                    <input type="hidden" id="editCategoryId" name="id">
                    <label for="editCategoryName">Tên danh mục:</label>
                    <input type="text" id="editCategoryName" name="name" required>
                    <button type="submit">Lưu</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/admin.js"></script>
    <script src="js/managecategory.js"></script>
</body>

</html>