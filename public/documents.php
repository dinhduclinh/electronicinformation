<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: admin/login.php');
    exit;
}

require_once '../app/controllers/DocumentController.php';

$documentController = new DocumentController();

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'])) {
    switch ($_POST['action']) {
        case 'add':
            $documentController->addDocument();
            break;
        case 'edit':
            $documentController->editDocument();
            break;
        case 'delete':
            $documentController->deleteDocument();
            break;
    }
    header("Location: documents.php");
    exit;
}

if (isset($_GET['action']) && isset($_GET['id'])) {
    $id = $_GET['id'];
    if ($_GET['action'] === 'edit') {
        $document = $documentController->getDocumentById($id);
        $editDocumentNumber = $document['document_number'];
        $editIssuedDate = $document['issued_date'];
        $editExcerpt = $document['excerpt'];
        $editAttachmentUrl = $document['attachment_url'];
        $editSigner = $document['signer'];
        $editDocumentTypeId = $document['document_type_id'];
    }
}

?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý văn bản điều hành</title>
    <link rel="stylesheet" href="css/admin.css">
</head>

<body>
    <?php include 'admin/sidebar.php'; ?>
    <div class="content">
        <h2>Quản lý văn bản điều hành</h2>

        <div>
            <label for="searchInput">Tìm kiếm:</label>
            <input type="text" id="searchInput" placeholder="Nhập từ khóa...">
            <label for="documentTypeFilter">Lọc:</label>
            <select id="documentTypeFilter">
                <option value="all">Tất cả</option>
                <?php foreach ($documentController->getAllDocumentTypes() as $type): ?>
                <option value="<?= $type['id'] ?>"><?= $type['name'] ?></option>
                <?php endforeach; ?>
            </select>
        </div>

        <div id="document-list">
            <?php
            function loadAllDocumentsContent($documentController) {
                $documents = $documentController->getAllDocuments();
                $stt = 1; 
                ob_start();
            ?>
            <table>
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Số hiệu văn bản</th>
                        <th>Ngày ban hành</th>
                        <th>Trích dẫn</th>
                        <th>Tệp đính kèm</th>
                        <th>Người ký</th>
                        <th>Loại văn bản</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($documents as $item): ?>
                    <tr data-type-id="<?= htmlspecialchars($item['document_type_id']) ?>">
                        <td><?= $stt++ ?></td>
                        <td><?= htmlspecialchars($item['document_number']) ?></td>
                        <td><?= htmlspecialchars($item['issued_date']) ?></td>
                        <td><?= htmlspecialchars($item['excerpt']) ?></td>
                        <td>
                            <?php if ($item['attachment_url']): ?>
                            <a href="<?= htmlspecialchars($item['attachment_url']) ?>" target="_blank">Xem Tệp</a>
                            <?php else: ?>
                            Không có tệp đính kèm
                            <?php endif; ?>
                        </td>

                        <td><?= htmlspecialchars($item['signer']) ?></td>
                        <td data-type-id="<?= htmlspecialchars($item['document_type_id']) ?>">
                            <?= htmlspecialchars($item['document_type_name']) ?>
                        </td>

                        <td>
                            <div class="action-buttons">
                                <button class="edit-btn" data-id="<?= $item['id'] ?>">Sửa</button>
                                <button class="delete-btn" data-id="<?= $item['id'] ?>">Xóa</button>
                            </div>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            <?php
                return ob_get_clean();
            }
            echo loadAllDocumentsContent($documentController);
            ?>
        </div>
    </div>

    <div id="editDocumentModal" class="modal">
        <div class="modal-overlay">
            <div class="modal-content">
                <span class="close" id="closeEditModal">&times;</span>
                <h3>Chỉnh sửa văn bản</h3>
                <form action="documents" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" id="editId" name="id">
                    <label for="editDocumentNumber">Số hiệu văn bản:</label>
                    <input type="text" id="editDocumentNumber" name="document_number" required><br><br>
                    <label for="editIssuedDate">Ngày ban hành:</label>
                    <input type="date" id="editIssuedDate" name="issued_date" required><br><br>
                    <label for="editExcerpt">Trích dẫn:</label>
                    <textarea id="editExcerpt" name="excerpt" rows="4"></textarea><br><br>
                    <label for="editAttachmentUrl">Tệp đính kèm:</label>
                    <span id="editAttachmentUrlDisplay"></span>
                    <input type="file" id="editAttachmentUrl" name="attachment_url" accept="application/pdf"><br><br>
                    <label for="editSigner">Người ký:</label>
                    <input type="text" id="editSigner" name="signer" required><br><br>
                    <label for="editDocumentTypeId">Loại văn bản:</label>
                    <select id="editDocumentTypeId" name="document_type_id" required>
                        <?php foreach ($documentController->getAllDocumentTypes() as $type): ?>
                        <option value="<?= $type['id'] ?>"
                            <?= isset($editDocumentTypeId) && $editDocumentTypeId == $type['id'] ? 'selected' : '' ?>>
                            <?= $type['name'] ?>
                        </option>
                        <?php endforeach; ?>
                    </select><br><br>

                    <button type="submit">Lưu</button>
                </form>
            </div>
        </div>
    </div>

    <div id="deleteDocumentModal" class="modal">
        <div class="modal-overlay">
            <div class="modal-content">
                <span class="close" id="closeDeleteDocumentModal">&times;</span>
                <p>Bạn chắc chắn muốn xóa văn bản này?</p>
                <form action="documents" method="post">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" id="deleteDocumentId" name="id">
                    <button type="submit">Xóa</button>
                    <button type="button" id="cancelDeleteDocument">Hủy</button>
                </form>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/document.js"></script>
</body>

</html>