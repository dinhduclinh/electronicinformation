<?php
session_start();
require_once __DIR__ . '/../controllers/DocumentController.php';
$documentController = new DocumentController();
$documents = $documentController->getAllDocuments();
require_once __DIR__ . '/../controllers/NewsController.php';
$newsController = new NewsController();

$categories = $newsController->getAllCates();
$categoryMap = [];
foreach ($categories as $category) {
    $categoryMap[$category['id']] = $category['name'];
}
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang thông tin điện tử</title>
    <link rel="stylesheet" href="../public/css/styles.css">
    <link rel="stylesheet" href="../public/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../public/js/script.js"></script>
    <script src="../public/js/documentview.js"></script>
</head>

<body>
    <?php include 'header.php'; ?>

    <div class="container">
        <div class="container">
            <div class="left-content">
                <div class="featured-news-section">
                    <h3 class="featured-news-title">Tin Nổi Bật</h3>
                    <div class="news-wrapper">
                        <?php
                        require_once __DIR__ . '/../controllers/NewsController.php';
                        $newsController = new NewsController();
                        $featuredNews = $newsController->getFeaturedNews();

                        if (!empty($featuredNews)):
                            $mainNews = $featuredNews[0]; 
                        ?>
                        <div class="main-news" id="main-news">
                            <div class="news-image" id="main-news-image">
                                <img src="<?php echo $mainNews['image_url']; ?>" alt="Main News Image">
                            </div>
                            <p class="news-title" id="main-news-title">
                                <?php echo htmlspecialchars($mainNews['title']); ?>
                            </p>
                        </div>
                        <div class="recent-news-list">
                            <ul>
                                <?php foreach ($featuredNews as $item): ?>
                                <li>
                                    <a href="newshtml.php?slug=<?= htmlspecialchars($item['url']) ?>" class="news-link"
                                        data-title="<?php echo htmlspecialchars($item['title']); ?>"
                                        data-image="<?php echo $item['image_url']; ?>">
                                        <?php echo htmlspecialchars($item['title']); ?>
                                    </a>
                                </li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                        <?php endif; ?>
                    </div>
                    <div class="news-carousel">
                        <button class="carousel-btn" id="prevBtn">&#10094;</button>
                        <div class="news-carousel-inner" id="carousel">
                            <?php foreach ($featuredNews as $item): ?>
                            <div class="carousel-item">
                                <img src="<?php echo $item['image_url']; ?>" alt="News Image">
                                <p><?php echo htmlspecialchars($item['title']); ?></p>
                            </div>
                            <?php endforeach; ?>
                        </div>
                        <button class="carousel-btn" id="nextBtn">&#10095;</button>
                    </div>
                </div>
            </div>

            <div class="right-sidebar">
                <!-- <div class="category-list">
                    <button>Công tác Đảng</button>
                    <button>Giáo dục - Đào tạo</button>
                    <button>Danh sách xã - thị trấn</button>
                </div> -->
                <div class="imgtt">
                    <a href="https://vanban.chinhphu.vn/?pageid=27160&docid=171264&classid=1&typegroupid=1">
                        <img src="../img/hienphap.jpg" alt="Middle Banner Image">
                    </a>
                    <a href="#">
                        <img src="../img/trangan1.gif" alt="Middle Banner Image">
                    </a>

                </div>
                <div class="sidebar-section">
                    <h3>Văn Bản Mới Ban Hành</h3>
                    <div class="scrolling-documents">
                        <ul id="documentList">
                            <?php foreach ($documents as $doc): ?>
                            <li><a href="<?php echo htmlspecialchars($doc['attachment_url']); ?>"> <strong>Văn bản số:
                                        <?php echo htmlspecialchars($doc['document_number']); ?></strong><br>
                                    <?php echo htmlspecialchars($doc['excerpt']); ?>
                                </a></li>
                            <?php endforeach; ?>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </div>



    <div class="middle-banner">
        <img src="../img/anhnammoi.jpg" alt="Middle Banner Image">
    </div>

    <div class="main-layout">
        <div class="left-banner">
            <h3 class="banner-heading"><?php echo htmlspecialchars($categoryMap[1]); ?></h3>
            <div class="scrolling-news">
                <ul class="latest-news-list" id="latestNewsList">
                    <?php foreach ($latestNews as $newsItem): ?>
                    <li>
                        <a href="newshtml.php?slug=<?php echo htmlspecialchars($newsItem['url']) ?>">
                            <?= htmlspecialchars($newsItem['title']) ?>
                        </a>
                    </li>
                    <?php endforeach; ?>
                </ul>
            </div>
            <div class="imgtt">
                <a href="https://www.google.com/maps/@20.3305512,105.9238875,11z">
                    <img src="../img/bdnb.jpg" alt="Middle Banner Image">
                </a>
                <a href="https://dichvucong.ninhbinh.gov.vn/public/linkto/tra-cuu-thu-tuc-co-quan?">
                    <img src="../img/cst.jpg" alt="Middle Banner Image">
                </a>
                <a href="https://ninhbinh.gov.vn/">
                    <img src="../img/congthongtin1.jpg" alt="Middle Banner Image">
                </a>
                <a href="https://mail.ninhbinh.gov.vn/">
                    <img src="../img/email.jpg" alt="Middle Banner Image">
                </a>
                <a
                    href="https://login.ninhbinh.gov.vn/authenticationendpoint/login.do?client_id=Cmj6KiXAjPDZ_ugM9hCFFYST6bca&commonAuthCallerPath=%2Foauth2%2Fauthorize&forceAuth=false&passiveAuth=false&redirect_uri=https%3A%2F%2Fqlvbyenkhanh.ninhbinh.gov.vn%2Flogin.aspx&response_type=code&scope=openid&state=%7B%27requester%27%3A%27http%3A%2F%2Fqlvbyenkhanh.ninhbinh.gov.vn%27%7D&tenantDomain=carbon.super&sessionDataKey=2b054744-c88f-49e7-8dfc-6f7c380be4a5&relyingParty=Cmj6KiXAjPDZ_ugM9hCFFYST6bca&type=oidc&sp=NBH_SSO_IOFFICE&isSaaSApp=false&authenticators=BasicAuthenticator%3ALOCAL">
                    <img src="../img/vanban.jpg" alt="Middle Banner Image">
                </a>
                <a
                    href="https://storage-vnportal.vnpt.vn/nbh-ubnd/sitefolders/root/vanban/2022/congkhaidonvitthc-cham-muon/100_phu_luc_danh_sach_ho_so_tre_han_-017_den_0102022-_.pdf">
                    <img src="../img/tthc.jpg" alt="Middle Banner Image">
                </a>
                <a href="https://ninhbinh.gov.vn/Default.aspx?sname=ubnd-ninhbinh&sid=4&pageid=27172">
                    <img src="../img/vbpl.jpg" alt="Middle Banner Image">
                </a>
                <a href="hoctap.php">
                    <img src="https://storage-vnportal.vnpt.vn/nbh-ubnd/sitefolders/root/2303/banner/hoc_tap_tam_guong_20171127033904211210.jpg"
                        alt="Middle Banner Image">
                </a>
                <a href="#">
                    <img src="../img/ocop.jpg" alt="Middle Banner Image">
                </a>
                <a href="#">
                    <img src="../img/dlnb.jpg" alt="Middle Banner Image">
                </a>

                <a>
                    <img src="../img/qrzalo.jpg" alt="Middle Banner Image">
                </a>
            </div>
        </div>

        <?php
        
require_once __DIR__ . '/../controllers/NewsController.php';

$newsController = new NewsController();
$newsData = $newsController->getNewsData();
$categoryImages = $newsController->getCategoryImages();
$categories = $newsController->getAllCates();

?>

        <div class="news-container">
            <!-- DU LỊCH - DỊCH VỤ -->
            <div class="news-section">
                <h2 class="section-title"><?php echo htmlspecialchars($categoryMap[2]); ?></h2>
                <div class="latest-news">
                    <img src="<?php echo $categoryImages['du_lich_dich_vu']; ?>" alt="Latest News Image"
                        class="latest-news-img">
                    <p class="latest-news-title"><a
                            href="newshtml.php?slug=<?php echo htmlspecialchars($newsData['duLichDichVu'][0]['url']); ?>"><?php echo htmlspecialchars($newsData['duLichDichVu'][0]['title']); ?></a>
                    </p>
                </div>
                <ul class="news-list">
                    <?php foreach (array_slice($newsData['duLichDichVu'], 1) as $item): ?>
                    <li><a
                            href="newshtml.php?slug=<?php echo htmlspecialchars($item['url']); ?>"><?php echo htmlspecialchars($item['title']); ?></a>
                    </li>
                    <?php endforeach; ?>
                </ul>
            </div>

            <!-- THÔNG TIN QUY HOẠCH -->
            <div class="news-section">
                <h2 class="section-title"><?php echo htmlspecialchars($categoryMap[3]); ?></h2>
                <div class="latest-news">
                    <img src="<?php echo $categoryImages['thong_tin_quy_hoach']; ?>" alt="Latest News Image"
                        class="latest-news-img">
                    <p class="latest-news-title"><a
                            href="newshtml.php?slug=<?php echo htmlspecialchars($newsData['thongTinQuyHoach'][0]['url']); ?>"><?php echo htmlspecialchars($newsData['thongTinQuyHoach'][0]['title']); ?></a>
                    </p>
                </div>
                <ul class="news-list">
                    <?php foreach (array_slice($newsData['thongTinQuyHoach'], 1) as $item): ?>
                    <li><a
                            href="newshtml.php?slug=<?php echo htmlspecialchars($item['url']); ?>"><?php echo htmlspecialchars($item['title']); ?></a>
                    </li>
                    <?php endforeach; ?>
                </ul>
            </div>

            <!-- CẢI CÁCH HÀNH CHÍNH -->
            <div class="news-section">
                <h2 class="section-title"><?php echo htmlspecialchars($categoryMap[4]); ?></h2>
                <div class="latest-news">
                    <img src="<?php echo $categoryImages['cai_cach_hanh_chinh']; ?>" alt="Latest News Image"
                        class="latest-news-img">
                    <p class="latest-news-title"><a
                            href="
                            newshtml.php?slug=<?php echo htmlspecialchars($newsData['caiCachHanhChinh'][0]['url']); ?>"><?php echo htmlspecialchars($newsData['caiCachHanhChinh'][0]['title']); ?></a>
                    </p>
                </div>
                <ul class="news-list">
                    <?php foreach (array_slice($newsData['caiCachHanhChinh'], 1) as $item): ?>
                    <li><a
                            href="newshtml.php?slug=<?php echo htmlspecialchars($item['url']); ?>"><?php echo htmlspecialchars($item['title']); ?></a>
                    </li>
                    <?php endforeach; ?>
                </ul>
            </div>

            <!-- PHỔ BIẾN PHÁP LUẬT -->
            <div class="news-section">
                <h2 class="section-title"><?php echo htmlspecialchars($categoryMap[5]); ?></h2>
                <div class="latest-news">
                    <img src="<?php echo $categoryImages['pho_bien_phap_luat']; ?>" alt="Latest News Image"
                        class="latest-news-img">
                    <p class="latest-news-title"><a
                            href="
                            newshtml.php?slug=<?php echo htmlspecialchars($newsData['phoBienPhapLuat'][0]['url']); ?>"><?php echo htmlspecialchars($newsData['phoBienPhapLuat'][0]['title']); ?></a>
                    </p>
                </div>
                <ul class="news-list">
                    <?php foreach (array_slice($newsData['phoBienPhapLuat'], 1) as $item): ?>
                    <li><a
                            href="newshtml.php?slug=<?php echo htmlspecialchars($item['url']); ?>"><?php echo htmlspecialchars($item['title']); ?></a>
                    </li>
                    <?php endforeach; ?>
                </ul>
            </div>

            <!-- THÔNG TIN - TIN TỨC -->
            <div class="news-section">
                <h2 class="section-title"><?php echo htmlspecialchars($categoryMap[6]); ?></h2>
                <div class="latest-news">
                    <img src="<?php echo $categoryImages['thong_tin_tin_tuc']; ?>" alt="Latest News Image"
                        class="latest-news-img">
                    <p class="latest-news-title"><a
                            href="newshtml.php?slug=<?php echo htmlspecialchars($newsData['thongTinTinTuc'][0]['url']); ?>"><?php echo htmlspecialchars($newsData['thongTinTinTuc'][0]['title']); ?></a>
                    </p>
                </div>
                <ul class="news-list">
                    <?php foreach (array_slice($newsData['thongTinTinTuc'], 1) as $item): ?>
                    <li><a
                            href="newshtml.php?slug=<?php echo htmlspecialchars($item['url']); ?>"><?php echo htmlspecialchars($item['title']); ?></a>
                    </li>
                    <?php endforeach; ?>
                </ul>
            </div>

            <!-- VĂN HÓA - XÃ HỘI -->
            <div class="news-section">
                <h2 class="section-title"><?php echo htmlspecialchars($categoryMap[7]); ?></h2>
                <div class="latest-news">
                    <img src="<?php echo $categoryImages['van_hoa_xa_hoi']; ?>" alt="Latest News Image"
                        class="latest-news-img">
                    <p class="latest-news-title"><a
                            href="newshtml.php?slug=<?php echo htmlspecialchars($newsData['vanHoaXaHoi'][0]['url']); ?>"><?php echo htmlspecialchars($newsData['vanHoaXaHoi'][0]['title']); ?></a>
                    </p>
                </div>
                <ul class="news-list">
                    <?php foreach (array_slice($newsData['vanHoaXaHoi'], 1) as $item): ?>
                    <li><a
                            href="newshtml.php?slug=<?php echo htmlspecialchars($item['url']); ?>"><?php echo htmlspecialchars($item['title']); ?></a>
                    </li>
                    <?php endforeach; ?>
                </ul>
            </div>

            <!-- QUỐC PHÒNG - AN NINH -->
            <div class="news-section">
                <h2 class="section-title"><?php echo htmlspecialchars($categoryMap[8]); ?></h2>
                <div class="latest-news">
                    <img src="<?php echo $categoryImages['quoc_phong_an_ninh']; ?>" alt="Latest News Image"
                        class="latest-news-img">
                    <p class="latest-news-title"><a
                            href="newshtml.php?slug=<?php echo htmlspecialchars($newsData['quocPhongAnNinh'][0]['url']); ?>"><?php echo htmlspecialchars($newsData['quocPhongAnNinh'][0]['title']); ?></a>
                    </p>
                </div>
                <ul class="news-list">
                    <?php foreach (array_slice($newsData['quocPhongAnNinh'], 1) as $item): ?>
                    <li><a
                            href="newshtml.php?slug=<?php echo htmlspecialchars($item['url']); ?>"><?php echo htmlspecialchars($item['title']); ?></a>
                    </li>
                    <?php endforeach; ?>
                </ul>
            </div>

            <!-- KINH TẾ -->
            <div class="news-section">
                <h2 class="section-title"><?php echo htmlspecialchars($categoryMap[9]); ?></h2>
                <div class="latest-news">
                    <img src="<?php echo $categoryImages['kinh_te']; ?>" alt="Latest News Image"
                        class="latest-news-img">
                    <p class="latest-news-title"><a
                            href="newshtml.php?slug=<?php echo htmlspecialchars($newsData['kinhTe'][0]['url']); ?>"><?php echo htmlspecialchars($newsData['kinhTe'][0]['title']); ?></a>
                    </p>
                </div>
                <ul class="news-list">
                    <?php foreach (array_slice($newsData['kinhTe'], 1) as $item): ?>
                    <li><a
                            href="newshtml.php?slug=<?php echo htmlspecialchars($item['url']); ?>"><?php echo htmlspecialchars($item['title']); ?></a>
                    </li>
                    <?php endforeach; ?>
                </ul>
            </div>
        </div>

    </div>

    <?php include 'footer.php'; ?>
</body>

</html>