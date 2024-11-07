<?php
require_once __DIR__ . '/../models/NewsModel.php';
require_once __DIR__ . '/../controllers/DocumentController.php';

class NewsController {
    public $model;

    public function __construct() {
        $this->model = new NewsModel();
    }

    public function index() {
        
        $latestNews = $this->model->getLatestNews();
        $documentController = new DocumentController();
        $documents = $documentController->getSidebarDocuments();

        include __DIR__ . '/../views/news.php';
    }

    public function displayNewsPage() {
        $news = $this->model->getNews(); 
        $latestNews = $this->model->getLatestNews(); 

        $categoryImages = $this->getCategoryImages();
        include __DIR__ . '/../views/news.php';
    }

    public function getNewsData() {
        $newsModel = new NewsModel();
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

        return array_slice($featuredNews,0,6);
    }

    public function getCateById($id) {
        return $this->model->getCateById($id);
    }

    public function getAllCates() {
        return $this->model->getAllCates();
    }
}
?>