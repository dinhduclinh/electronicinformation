<?php
require_once __DIR__ . '/../models/NewsModel.php';

class NewsController {
    public $model;

    public function __construct() {
        $this->model = new NewsModel();
    }

    public function index() {
        // Lấy tất cả tin tức
        $news = $this->model->getNews();
        // Lấy tin tức mới nhất
        $latestNews = $this->model->getLatestNews();
        // Truyền dữ liệu vào view
        include __DIR__ . '/../views/news.php';
    }

    // Hàm để hiển thị trang tin tức chính
    public function displayNewsPage() {
        $news = $this->model->getNews();  // Lấy tất cả các tin tức chính
        $latestNews = $this->model->getLatestNews();  // Lấy tin mới từ bảng `latest_news`
        // Lấy hình ảnh từ tin tức mới nhất của từng loại tin tức
        $categoryImages = $this->getCategoryImages();
        // Truyền dữ liệu vào view
        include __DIR__ . '/../views/news.php';
    }

    // Phương thức mới để lấy dữ liệu từ các bảng
    public function getNewsData() {
        $newsModel = new NewsModel();
        // Lấy dữ liệu từ các bảng
        $duLichDichVu = $newsModel->getNewsByCategory('du_lich_dich_vu');
        $thongTinQuyHoach = $newsModel->getNewsByCategory('thong_tin_quy_hoach');
        $caiCachHanhChinh = $newsModel->getNewsByCategory('cai_cach_hanh_chinh');
        $phoBienPhapLuat = $newsModel->getNewsByCategory('pho_bien_phap_luat');
        $thongTinTinTuc = $newsModel->getNewsByCategory('thong_tin_tin_tuc');
        $vanHoaXaHoi = $newsModel->getNewsByCategory('van_hoa_xa_hoi');
        $quocPhongAnNinh = $newsModel->getNewsByCategory('quoc_phong_an_ninh');
        $kinhTe = $newsModel->getNewsByCategory('kinh_te');
        return [
            'duLichDichVu' => $duLichDichVu,
            'thongTinQuyHoach' => $thongTinQuyHoach,
            'caiCachHanhChinh' => $caiCachHanhChinh,
            'phoBienPhapLuat' => $phoBienPhapLuat,
            'thongTinTinTuc' => $thongTinTinTuc,
            'vanHoaXaHoi' => $vanHoaXaHoi,
            'quocPhongAnNinh' => $quocPhongAnNinh,
            'kinhTe' => $kinhTe
        ];
    }

    // Phương thức để lấy hình ảnh từ tin tức mới nhất của từng loại tin tức
    public function getCategoryImages() {
        $categories = [
            'du_lich_dich_vu',
            'thong_tin_quy_hoach',
            'cai_cach_hanh_chinh',
            'pho_bien_phap_luat',
            'thong_tin_tin_tuc',
            'van_hoa_xa_hoi',
            'quoc_phong_an_ninh',
            'kinh_te'
        ];
        $images = [];
        foreach ($categories as $category) {
            $latestNews = $this->model->getLatestNewsByCategory($category);
            if (!empty($latestNews) && isset($latestNews[0]['image_url'])) {
                $images[$category] = $latestNews[0]['image_url'];
            } else {
                $images[$category] = '';
            }
        }
        return $images;
    }
    public function getFeaturedNews() {
        $categories = [
            'du_lich_dich_vu',
            'thong_tin_quy_hoach',
            'cai_cach_hanh_chinh',
            'pho_bien_phap_luat',
            'thong_tin_tin_tuc',
            'van_hoa_xa_hoi',
            'quoc_phong_an_ninh',
            'kinh_te'
        ];

        $featuredNews = [];

        foreach ($categories as $category) {
            $news = $this->model->getFeaturedNewsByCategory($category);
            if (!empty($news)) {
                $featuredNews = array_merge($featuredNews, $news);
            }
        }

        return $featuredNews;
    }
}
?>