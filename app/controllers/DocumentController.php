<?php
require_once __DIR__ . '/../models/DocumentModel.php';

class DocumentController {
    public $model;

    public function __construct() {
        $this->model = new DocumentModel();
    }

    public function handleRequest() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (isset($_POST['action'])) {
                switch ($_POST['action']) {
                    case 'add':
                        $this->addDocument();
                        break;
                    case 'edit':
                        $this->editDocument();
                        break;
                    case 'delete':
                        $this->deleteDocument();
                        break;
                }
            }
        }
    }

    public function addDocument() {
        $document_number = $_POST['document_number'];
        $issued_date = $_POST['issued_date'];
        $excerpt = $_POST['excerpt'];
        $signer = $_POST['signer'];
        $document_type_id = $_POST['document_type_id'];

        // Kiểm tra và lưu file PDF nếu được tải lên
        if (isset($_FILES['attachment_url']) && $_FILES['attachment_url']['error'] === UPLOAD_ERR_OK) {
            $uploadsDir = __DIR__ . '/../../pdf/';
            $fileName = basename($_FILES['attachment_url']['name']);
            $filePath = $uploadsDir . $fileName;

            // Di chuyển file đến thư mục lưu trữ
            if (move_uploaded_file($_FILES['attachment_url']['tmp_name'], $filePath)) {
                $attachment_url = '/ProjectOJT/pdf/' . $fileName; // Đường dẫn lưu trong cơ sở dữ liệu
            } else {
                $attachment_url = null;
            }
        } else {
            $attachment_url = null;
        }

        $this->model->addDocument($document_number, $issued_date, $excerpt, $attachment_url, $signer, $document_type_id);
    }

    public function editDocument() {
        $id = $_POST['id'];
        $document_number = $_POST['document_number'];
        $issued_date = $_POST['issued_date'];
        $excerpt = $_POST['excerpt'];
        $signer = $_POST['signer'];
        $document_type_id = $_POST['document_type_id'];

        // Kiểm tra và lưu file PDF nếu được tải lên
        if (isset($_FILES['attachment_url']) && $_FILES['attachment_url']['error'] === UPLOAD_ERR_OK) {
            $uploadsDir = __DIR__ . '/../../pdf/';
            $fileName = basename($_FILES['attachment_url']['name']);
            $filePath = $uploadsDir . $fileName;

            // Di chuyển file đến thư mục lưu trữ
            if (move_uploaded_file($_FILES['attachment_url']['tmp_name'], $filePath)) {
                $attachment_url = '/ProjectOJT/pdf/' . $fileName; // Đường dẫn lưu trong cơ sở dữ liệu
            } else {
                $attachment_url = null;
            }
        } else {
            // Không thay đổi file nếu không có file mới được tải lên
            $attachment_url = $this->model->getDocumentById($id)['attachment_url'];
        }

        $this->model->editDocument($id, $document_number, $issued_date, $excerpt, $attachment_url, $signer, $document_type_id);
    }

    public function deleteDocument() {
        $id = $_POST['id'];
        $this->model->deleteDocument($id);
    }

    public function getAllDocuments() {
        return $this->model->getAllDocuments();
    }

    public function getDocumentById($id) {
        return $this->model->getDocumentById($id);
    }

    public function getAllDocumentTypes() {
        return $this->model->getAllDocumentTypes();
    }
}