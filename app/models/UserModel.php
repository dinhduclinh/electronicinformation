<?php
require_once __DIR__ . '/../../config/database.php';

class UserModel {
    private $conn;

    public function __construct() {
        $database = new Database();
        $this->conn = $database->getConnection();
    }

    public function getUserByUsername($username) {
        $query = "SELECT * FROM users WHERE username = :username";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':username', $username);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function createUser($username, $password, $full_name, $email) {
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
        $query = "INSERT INTO users (username, password, full_name, email) VALUES (:username, :password, :full_name, :email)";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':password', $hashedPassword);
        $stmt->bindParam(':full_name', $full_name);
        $stmt->bindParam(':email', $email);
        return $stmt->execute();
    }

    public function getAllUsers() {
        $query = "SELECT id, username, full_name, email FROM users";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>