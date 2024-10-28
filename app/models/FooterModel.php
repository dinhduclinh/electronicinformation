<?php

class FooterModel {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function getFooterContent() {
        $query = "SELECT content FROM footers LIMIT 1";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function updateFooterContent($content) {
        $query = "UPDATE footers SET content = :content WHERE id = 1";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(':content', $content);
        return $stmt->execute();
    }
}