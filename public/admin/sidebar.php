<?php
$full_name = isset($_SESSION['full_name']) ? $_SESSION['full_name'] : 'Khách';
?>

<div class="sidebar">
    <h2>Hello, <?= htmlspecialchars($full_name) ?></h2>
    <ul>
        <h2><a href="admin.php">Quản trị website</a></h2>
        <li><a href="edit_welcome_message">Thông báo đầu trang</a></li>
        <li><a href="edit_footer">Chân trang</a></li>
        <li class="parent-item">
            <a href="#" id="toggleArticles" onclick="toggleArticleButtons(event)">
                Bài viết <span id="arrow" class="arrow down">▼</span>
            </a>
            <ul id="articleButtons" class="hidden">
                <li class="submenu-item">
                    <a href="admin.php">Danh sách</a>
                </li>
                <li class="submenu-item">
                    <a href="Addnews">Thêm mới</a>
                </li>
            </ul>

        </li>
        <li><a href="ManageCategories">Chuyên mục</a></li>
        <li><a href="create_user">Tài khoản</a></li>
        <li class="parent-item">
            <a href="#" id="toggleDocuments" onclick="toggleDocumentButtons(event)">
                Văn bản điều hành <span id="documentArrow" class="arrow down">▼</span>
            </a>
            <ul id="documentButtons" class="hidden">
                <li class="submenu-item">
                    <a href="documents.php">Danh sách</a>
                </li>
                <li class="submenu-item">
                    <a href="adddocument.php">Thêm mới</a>
                </li>
            </ul>
        </li>
    </ul>
</div>

<!-- Liên kết CSS và JavaScript -->
<link rel="stylesheet" href="css/sidebar.css">
<script src="js/sidebar.js"></script>