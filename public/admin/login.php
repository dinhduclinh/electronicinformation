<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập Quản trị</title>
    <link rel="stylesheet" href="../css/login.css">
</head>

<body>
    <div class="login-container">
        <div class="login-box">
            <h2>Đăng nhập</h2>
            <?php
            if (session_status() == PHP_SESSION_NONE) {
                session_start();
            }
            if (isset($_SESSION['error'])) {
                echo '<p class="error">' . htmlspecialchars($_SESSION['error']) . '</p>';
                unset($_SESSION['error']); 
            }
            ?>
            <form action="login_process.php" method="post">
                <div class="input-group">
                    <label for="username">Tên đăng nhập:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="input-group">
                    <label for="password">Mật khẩu:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="input-group">
                    <label for="captcha">Mã Captcha:</label>
                    <div class="captcha-row">
                        <img src="captcha.php" alt="Captcha">
                        <input type="text" id="captcha" name="captcha" required>
                    </div>
                </div>

                <div class="button-group">
                    <a href="../index.php" class="back-link">Quay lại</a>
                    <button type="submit">Đăng nhập</button>
                </div>
            </form>
        </div>
    </div>
</body>

</html>