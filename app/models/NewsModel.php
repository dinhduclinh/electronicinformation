<?php
require_once __DIR__ . '/../../config/database.php';

class NewsModel {
    private $conn;

    public function __construct() {
        $database = new Database();
        $this->conn = $database->getConnection();
    }


    // Lấy tin tức theo ID
    public function getNewsById($id) {
        $stmt = $this->conn->prepare("SELECT * FROM news WHERE id = ?");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Lấy tin tức mới nhất
    public function getLatestNews() {
    $query = "SELECT * FROM latest_news ORDER BY published_date DESC";
    $stmt = $this->conn->prepare($query);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

    public function getNewsByCategory($category) {
        $query = "SELECT * FROM $category ORDER BY published_date DESC";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getLatestNewsByCategory($category) {
        $query = "SELECT * FROM $category ORDER BY published_date DESC LIMIT 1";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getFeaturedNewsByCategory($category) {
        $query = "SELECT * FROM $category WHERE is_featured = 1 ORDER BY published_date DESC LIMIT 6";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

}