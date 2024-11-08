<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: admin/login.php');
    exit;
}

require_once '../app/controllers/DocumentController.php';
$documentController = new DocumentController();

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'add') {
    $documentController->addDocument();
    header("Location: documents.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm mới văn bản</title>
    <link rel="stylesheet" href="css/admin.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/adddocument.js"></script>
</head>

<body>
    <?php include 'admin/sidebar.php'; ?>
    <div class="content">
        <h2>Thêm mới văn bản</h2>
        <form action="adddocument.php" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="add"><br>
            <label for="document_number">Số hiệu văn bản:</label>
            <input type="text" id="document_number" name="document_number" required><br><br>
            <label for="issued_date">Ngày ban hành:</label>
            <input type="date" id="issued_date" name="issued_date" required><br><br>
            <label for="excerpt">Trích dẫn:</label>
            <textarea id="excerpt" name="excerpt" rows="4"></textarea><br><br>
            <label for="attachment_url">Tệp đính kèm:</label>
            <input type="file" id="attachment_url" name="attachment_url" accept="application/pdf" required><br><br>
            <label for="signer">Người ký:</label>
            <input type="text" id="signer" name="signer" required><br><br>
            <label for="document_type_id">Loại văn bản:</label>
            <select id="document_type_id" name="document_type_id" required>
                <?php foreach ($documentController->getAllDocumentTypes() as $type): ?>
                <option value="<?= $type['id'] ?>"><?= $type['name'] ?></option>
                <?php endforeach; ?>
            </select><br><br>
            <button type="submit">Thêm</button>
        </form>
    </div>
</body>

</html>