<?php
session_start();
require_once '../app/controllers/VoteController.php'; // Đảm bảo đường dẫn đúng

$controller = new VoteController(); 
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên Hệ Góp Ý</title>
    <link rel="stylesheet" href="../public/css/styles.css">
    <link rel="stylesheet" href="../public/css/importheader.css">
    <link rel="stylesheet" href="../public/css/lienhe.css">
</head>

<body class="lienhe-body">
    <?php include '../app/views/header.php'; ?>

    <div class="lienhe-container">
        <h1 class="lienhe-title">Liên Hệ Góp Ý</h1>
        <form class="lienhe-form" action="process_feedback.php" method="post">
            <label for="title">Tiêu đề:</label>
            <input type="text" id="title" name="title" required>
            <label for="content">Nội dung:</label>
            <textarea id="content" name="content" required></textarea>
            <label for="email">Email của bạn:</label>
            <input type="email" id="email" name="email" required>
            <label for="phone">Điện thoại:</label>
            <input type="tel" id="phone" name="phone" required>
            <div class="lienhe-captcha">
                <img src="admin/captcha.php" alt="Captcha">
                <input type="text" name="captcha" placeholder="Nhập mã captcha" required>
            </div>
            <button type="submit">Gửi góp ý</button>
        </form>
    </div>

    <div class="vote-section">
        <h2>Bạn quan tâm mục gì nhất trong Website của chúng tôi?</h2>
        <form id="voteForm" action="http://localhost/ProjectOJT/app/controllers/VoteController.php?action=vote"
            method="POST">
            <label>
                <input type="radio" name="vote" value="1" required> Giới thiệu
            </label><br>
            <label>
                <input type="radio" name="vote" value="2"> Kinh tế - Xã hội
            </label><br>
            <label>
                <input type="radio" name="vote" value="3"> Du lịch dịch vụ
            </label><br>
            <label>
                <input type="radio" name="vote" value="4"> Văn bản pháp luật
            </label><br>
            <label>
                <input type="radio" name="vote" value="5"> Quốc phòng - An ninh
            </label><br>
            <button type="submit">Bình chọn</button>
            <button type="button" id="resultsBtn">Kết quả</button> <!-- Thêm id để xử lý sự kiện -->
        </form>
    </div>

    <div id="voteResultsModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Kết quả bình chọn</h2>
            <div id="resultsContent">
                <?php
                if (isset($_GET['action']) && $_GET['action'] === 'results') {
                    $controller->showResults();
                }
                ?>
            </div>
        </div>
    </div>

    <?php include '../app/views/footer.php'; ?>
    <script src="../public/js/vote.js"></script>
</body>

</html>