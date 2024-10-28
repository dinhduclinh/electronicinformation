<?php

require_once __DIR__ . '/../../config/database.php';

class AdminModel {
    private $conn;

    public function __construct() {
        $database = new Database();
        $this->conn = $database->getConnection();
        if (!$this->conn) {
            die("Kết nối cơ sở dữ liệu thất bại: " . mysqli_connect_error());
        }
    }

    // Phương thức công khai để truy cập kết nối cơ sở dữ liệu
    public function getConnection() {
        return $this->conn;
    }

    // Lấy danh sách tin tức theo danh mục
    public function getNewsByCategory($category) {
        $sql = "SELECT * FROM $category ORDER BY published_date DESC";  // Dùng tên bảng theo danh mục
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }

    // Lấy tin tức theo ID
    public function getNewsById($id) {
        $sql = "SELECT *, 'news' AS category FROM news WHERE id = ?"; // Thêm 'news' AS category
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Thêm tin mới
    public function addNews($title, $slug, $image_url, $content, $category, $is_featured) {
        $sql = "INSERT INTO $category (title, url, image_url, content, published_date, is_featured) VALUES (?, ?, ?, ?, NOW(), ?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $title, PDO::PARAM_STR);
        $stmt->bindParam(2, $slug, PDO::PARAM_STR);
        $stmt->bindParam(3, $image_url, PDO::PARAM_STR);
        $stmt->bindParam(4, $content, PDO::PARAM_STR);
        $stmt->bindParam(5, $is_featured, PDO::PARAM_INT);
        return $stmt->execute();
    }

    // Sửa tin tức
    public function editNews($id, $title, $image_url, $content, $category, $is_featured) {
        try {
            // Tạo slug từ tiêu đề
            $slug = $this->generateSlug($title);

            $sql = "UPDATE $category SET title = ?, url = ?, image_url = ?, content = ?, is_featured = ? WHERE id = ?";
            $stmt = $this->conn->prepare($sql);
            $stmt->bindParam(1, $title, PDO::PARAM_STR);
            $stmt->bindParam(2, $slug, PDO::PARAM_STR); // Cập nhật thành slug
            $stmt->bindParam(3, $image_url, PDO::PARAM_STR);
            $stmt->bindParam(4, $content, PDO::PARAM_STR);
            $stmt->bindParam(5, $is_featured, PDO::PARAM_INT);
            $stmt->bindParam(6, $id, PDO::PARAM_INT);
            return $stmt->execute();
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
    }

    public function generateSlug($title) {
        // Chuyển về chữ thường
        $slug = strtolower($title);

        // Loại bỏ dấu tiếng Việt
        $slug = preg_replace('/(á|à|ả|ã|ạ|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ)/', 'a', $slug);
        $slug = preg_replace('/(é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ)/', 'e', $slug);
        $slug = preg_replace('/(í|ì|ỉ|ĩ|ị)/', 'i', $slug);
        $slug = preg_replace('/(ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ)/', 'o', $slug);
        $slug = preg_replace('/(ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự)/', 'u', $slug);
        $slug = preg_replace('/(ý|ỳ|ỷ|ỹ|ỵ)/', 'y', $slug);
        $slug = preg_replace('/(đ)/', 'd', $slug);

        // Loại bỏ ký tự đặc biệt
        $slug = preg_replace('/[^a-z0-9\s-]/', '', $slug);

        // Thay khoảng trắng và dấu gạch dưới bằng dấu gạch nối
        $slug = preg_replace('/[\s-]+/', '-', $slug);

        // Loại bỏ dấu gạch nối thừa ở đầu và cuối
        $slug = trim($slug, '-');

        return $slug;
    }

    // Xóa tin tức
    public function deleteNews($id, $category) {
        $sql = "DELETE FROM $category WHERE id = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $id, PDO::PARAM_INT);
        return $stmt->execute();
    }

    // Lấy tất cả các tin tức từ tất cả các bảng
    public function getAllNews() {
        $categories = [
            'news', 'latest_news', 'du_lich_dich_vu', 'thong_tin_quy_hoach',
            'cai_cach_hanh_chinh', 'pho_bien_phap_luat', 'thong_tin_tin_tuc', 'van_hoa_xa_hoi',
            'quoc_phong_an_ninh', 'kinh_te'
        ];

        $allNews = [];

        foreach ($categories as $category) {
            $sql = "SELECT *, '$category' AS category FROM $category ORDER BY published_date DESC"; // Thêm '$category' AS category
            $stmt = $this->conn->prepare($sql);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            $allNews = array_merge($allNews, $result);
        }

        // Sắp xếp lại theo ngày đăng
        usort($allNews, function($a, $b) {
            return strtotime($b['published_date']) - strtotime($a['published_date']);
        });

        return $allNews;
    }

    public function getNewsBySlug($slug) {
        // Danh sách các bảng cần kiểm tra
        $categories = [
            'news', 'latest_news', 'du_lich_dich_vu', 'thong_tin_quy_hoach',
            'cai_cach_hanh_chinh', 'pho_bien_phap_luat', 'thong_tin_tin_tuc', 'van_hoa_xa_hoi',
            'quoc_phong_an_ninh', 'kinh_te'
        ];

        foreach ($categories as $category) {
            $sql = "SELECT *, '$category' AS category FROM $category WHERE url = ?";
            $stmt = $this->conn->prepare($sql);
            $stmt->bindParam(1, $slug, PDO::PARAM_STR);
            $stmt->execute();

            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($result) {
                return $result;
            }
        }

        return null;
    }
}