<?php
require_once __DIR__ . '/../../config/database.php';
require_once __DIR__ . '/../models/VoteModel.php'; 
class VoteController {
    private $db;
    private $voteModel;

    public function __construct() {
        $this->db = new Database();
        $this->voteModel = new VoteModel($this->db->getConnection());
    }

    public function vote() {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        unset($_SESSION['results_displayed']);
        
        if (isset($_POST['vote'])) {
            $optionId = $_POST['vote'];

            error_log("Selected Option ID: " . $optionId); 

            if ($this->voteModel->addVote($optionId)) {
                echo "<script>alert('Bình chọn thành công!'); window.location.href='/ProjectOJT/public/lienhe.php?action=results';</script>";
            } else {
                echo "<script>alert('Có lỗi xảy ra, vui lòng thử lại.'); window.location.href='/ProjectOJT/public/lienhe.php';</script>";
            }
        } else {
            echo "<script>alert('Không có tùy chọn nào được chọn.'); window.location.href='/ProjectOJT/public/lienhe.php';</script>";
        }
    }
}



    public function results() {
        return $this->voteModel->getResults();
    }

    public function showResults() {
    // Chỉ hiển thị kết quả nếu người dùng đã bình chọn
    $results = $this->results();
    $totalVotes = array_sum(array_column($results, 'vote_count')); // Tổng số bình chọn

    if ($totalVotes > 0) {
        echo "<ul>";
        foreach ($results as $result) {
            $percentage = $totalVotes > 0 ? ($result['vote_count'] / $totalVotes) * 100 : 0; // Tính tỷ lệ phần trăm
            echo "<li>" . htmlspecialchars($result['option_name']) . ": " . number_format($percentage, 2) . "%</li>";
        }
        echo "</ul>";
    } else {
        echo "<p>Chưa có bình chọn nào được thực hiện.</p>";
    }
}





}

// Tạo đối tượng VoteController
$controller = new VoteController();

// Gọi phương thức tương ứng dựa trên action
if (isset($_GET['action']) && method_exists($controller, $_GET['action'])) {
    $controller->{$_GET['action']}();
}