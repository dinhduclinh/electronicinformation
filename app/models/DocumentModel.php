<?php
require_once __DIR__ . '/../../config/database.php';

class DocumentModel {
    private $conn;

    public function __construct() {
        $database = new Database();
        $this->conn = $database->getConnection();
        if (!$this->conn) {
            die("Kết nối cơ sở dữ liệu thất bại: " . mysqli_connect_error());
        }
    }

    public function getConnection() {
        return $this->conn;
    }

    public function getAllDocumentTypes() {
        $sql = "SELECT * FROM document_types";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getAllDocuments() {
        $sql = "SELECT d.*, dt.name AS document_type_name FROM documents d
                JOIN document_types dt ON d.document_type_id = dt.id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function addDocument($document_number, $issued_date, $excerpt, $attachment_url, $signer, $document_type_id) {
        $sql = "INSERT INTO documents (document_number, issued_date, excerpt, attachment_url, signer, document_type_id) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $document_number, PDO::PARAM_STR);
        $stmt->bindParam(2, $issued_date, PDO::PARAM_STR);
        $stmt->bindParam(3, $excerpt, PDO::PARAM_STR);
        $stmt->bindParam(4, $attachment_url, PDO::PARAM_STR); 
        $stmt->bindParam(5, $signer, PDO::PARAM_STR);
        $stmt->bindParam(6, $document_type_id, PDO::PARAM_INT);
        return $stmt->execute();
    }

    public function editDocument($id, $document_number, $issued_date, $excerpt, $attachment_url, $signer, $document_type_id) {
        $sql = "UPDATE documents SET document_number = ?, issued_date = ?, excerpt = ?, attachment_url = ?, signer = ?, document_type_id = ? WHERE id = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $document_number, PDO::PARAM_STR);
        $stmt->bindParam(2, $issued_date, PDO::PARAM_STR);
        $stmt->bindParam(3, $excerpt, PDO::PARAM_STR);
        $stmt->bindParam(4, $attachment_url, PDO::PARAM_STR);
        $stmt->bindParam(5, $signer, PDO::PARAM_STR);
        $stmt->bindParam(6, $document_type_id, PDO::PARAM_INT);
        $stmt->bindParam(7, $id, PDO::PARAM_INT);
        return $stmt->execute();
    }

    public function deleteDocument($id) {
        $sql = "DELETE FROM documents WHERE id = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $id, PDO::PARAM_INT);
        return $stmt->execute();
    }

    public function getDocumentById($id) {
        $sql = "SELECT * FROM documents WHERE id = ? ORDER BY issued_date DESC";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}