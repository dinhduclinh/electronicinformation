-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 12, 2024 at 09:30 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb3 */;

--
-- Database: `ninhbinh_news`
--

-- --------------------------------------------------------

--
-- Table structure for table `cai_cach_hanh_chinh`
--

DROP TABLE IF EXISTS `cai_cach_hanh_chinh`;
CREATE TABLE IF NOT EXISTS `cai_cach_hanh_chinh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `published_date` date NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `content` text,
  `is_featured` tinyint(1) DEFAULT '0',
  `excerpt` text,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `cai_cach_hanh_chinh`
--

INSERT INTO `cai_cach_hanh_chinh` (`id`, `title`, `url`, `published_date`, `image_url`, `content`, `is_featured`, `excerpt`, `category_id`) VALUES
(3, 'Quy định về mẫu “Sổ hồng” mới', 'quy-dinh-ve-mau-so-hong-moi', '2024-10-03', 'https://bcp.cdnchinhphu.vn/334894974524682240/2024/8/12/shm-17234598635371266233449.jpg', '', 0, '', 4),
(4, 'Ninh Bình ban hành Kế hoạch triển khai thực hiện tinh giản biên chế năm 2025', 'ninh-binh-ban-hanh-ke-hoach-trien-khai-thuc-hien-tinh-gian-bien-che-nam-2025', '2024-10-28', 'https://storage-vnportal.vnpt.vn/nbh-ubnd/2476/anhbai/nam2023/tinhgian.png', '<p>&nbsp;</p><p>&nbsp;</p><p><img src=\"https://storage-vnportal.vnpt.vn/nbh-ubnd/2476/anhbai/nam2023/tinhgian.png\" alt=\"anh tin bai\"></p><p><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Ảnh minh họa</i></p><p>&nbsp;</p><p>Thực hiện tinh giản biên chế tỉnh Ninh Bình năm 2025 nhằm mục đích triển khai thực hiện đồng bộ, nghiêm túc, có hiệu quả các quy định của pháp luật về tinh giản biên chế. Nâng cao nhận thức của các cơ quan, tổ chức, cá nhân có liên quan về chính sách tinh giản biên chế. Xây dựng tổ chức bộ máy hành chính, đơn vị sự nghiệp công lập tinh gọn, hiệu lực, hiệu quả phù hợp với chức năng, nhiệm vụ, đáp ứng yêu cầu phát triển kinh tế, xã hội và tiến trình cải cách nền hành chính nhà nước. Bố trí đúng người, đúng việc theo vị trí việc làm, cơ cấu ngạch công chức, cơ cấu chức danh nghề nghiệp viên chức và tiêu chuẩn chuyên môn nghiệp vụ, khung năng lực; từng bước nâng cao chất lượng đội ngũ cán bộ, công chức, viên chức đáp ứng yêu cầu cải cách chế độ công vụ, công chức.</p><p>&nbsp;</p><p>Thực hiện tinh giản biên chế trên nguyên tắc: Bảo đảm sự lãnh đạo của Đảng, phát huy vai trò giám sát của các tổ chức chính trị - xã hội và nhân dân trong quá trình thực hiện tinh giản biên chế; Gắn tinh giản biên chế với sắp xếp tổ chức bộ máy theo hướng tinh gọn, hoạt động hiệu lực, hiệu quả và cơ cấu lại, nâng cao chất lượng đội ngũ cán bộ, công chức, viên chức theo vị trí việc làm, phù hợp với cơ chế tự chủ của cơ quan, tổ chức, đơn vị; Bảo đảm nguyên tắc tập trung dân chủ, khách quan, công bằng, công khai, minh bạch và theo quy định của pháp luật. Bảo đảm chi trả chế độ, chính sách tinh giản biên chế kịp thời, đầy đủ theo quy định của pháp luật, bảo đảm sử dụng hiệu quả ngân sách nhà nước; Người đứng đầu phải chịu trách nhiệm về kết quả thực hiện tinh giản biên chế trong cơ quan, tổ chức, đơn vị được giao quản lý theo thẩm quyền; Đối tượng tinh giản biên chế nếu được bầu cử, tuyển dụng lại vào các cơ quan, tổ chức, đơn vị hưởng lương từ ngân sách nhà nước trong thời gian 60 tháng kể từ ngày thực hiện tinh giản biên chế thì phải hoàn trả lại số tiền trợ cấp đã nhận cho cơ quan, tổ chức, đơn vị đã chi trả trợ cấp.</p><p>&nbsp;</p><p>UBND tỉnh yêu cầu các Sở, ban, ngành, UBND các huyện, thành phố và các cơ quan, đơn vị có liên quan tiếp tục đẩy mạnh công tác tuyên truyền, phổ biến các chủ trương của Đảng, chính sách, pháp luật của Nhà nước về quản lý, sử dụng biên chế, tinh giản biên chế và cơ cấu lại đội ngũ cán bộ, công chức, viên chức; tổ chức thực hiện nghiêm túc, có hiệu quả các văn bản chỉ đạo của Trung ương, của tỉnh về tinh giản biên chế. Tiếp tục thực hiện nghiêm chủ trương tinh giản biên chế giai đoạn 2022- 2026, bảo đảm đến năm 2026 tinh giản tối thiểu 5% đối với biên chế cán bộ, công chức và ít nhất 10% biên chế viên chức hưởng lương từ ngân sách nhà nước theo quy định. Việc tuyển dụng công chức, viên chức phải đảm bảo mục tiêu tinh giản biên chế giai đoạn 2022-2026, trong đó, chú trọng thực hiện chính sách thu hút nhân tài; Khuyến khích cán bộ, công chức, viên chức không đảm bảo sức khỏe để làm việc hoặc năng lực hạn chế tự nguyện nghỉ chế độ hoặc chuyển đổi công tác khác. Quan tâm giải quyết chế độ, chính sách theo quy định cho các đối tượng bị ảnh hưởng trực tiếp trong quá trình sắp xếp tổ chức bộ máy, tinh giản biên chế; Hằng năm thực hiện đánh giá xếp loại chất lượng cán bộ, công chức, viên chức theo quy định; Cơ cấu lại đội ngũ cán bộ, công chức, viên chức bảo đảm phù hợp chức năng, nhiệm vụ của cơ quan, đơn vị; xây dựng kế hoạch đào tạo, bồi dưỡng, quy hoạch, luân chuyển đối với những công chức, viên chức có đủ năng lực, phẩm chất, đạo đức, có triển vọng phát triển.</p><p>&nbsp;</p><p>Thực hiện chính sách tinh giản biên chế: Trong đó, lập danh sách đối tượng tinh giản biên chế và dự toán số tiền trợ cấp cho từng đối tượng gửi về Sở Nội vụ, Sở Tài chính thẩm định báo cáo UBND tỉnh định kỳ 04 lần/năm, cụ thể: Đợt 1: Đối với trường hợp nghỉ tinh giản trong quý I hồ sơ gửi trước ngày 15/11/2024; Đợt 2: Đối với trường hợp nghỉ tinh giản trong quý II hồ sơ gửi trước ngày 15/02/2025; &nbsp;Đợt 3: Đối với trường hợp nghỉ tinh giản trong quý III hồ sơ gửi trước ngày 15/5/2025; &nbsp;Đợt 4: Đối với trường hợp nghỉ tinh giản trong quý IV hồ sơ gửi trước ngày 15/8/2025.</p><p>&nbsp;</p><p>Dự kiến số lượng nghỉ tinh giản biên chế trong năm 2025 là 115 người, trong đó, 06 công chức; 90 viên chức; 19 cán bộ, công chức cấp xã.</p>', 0, '<p><strong>Ngày 22/10/2024, UBND tỉnh ban hành Kế hoạch số 185/KH-UBND về việc triển khai thực hiện tinh giản biên chế tỉnh Ninh Bình năm 2025.</strong></p>', NULL),
(15, 'Triển khai thí điểm Sổ sức khỏe điện tử tích hợp trên ứng dụng VNeID trên địa bàn tỉnh Ninh Bình', 'trien-khai-thi-diem-so-suc-khoe-dien-tu-tich-hop-tren-ung-dung-vneid-tren-dia-ban-tinh-ninh-binh', '2024-11-12', 'https://storage-vnportal.vnpt.vn/nbh-ubnd/2476/anhbai/nam2023/Brand%20Research%20Presentation%20(1).jpg', '<p><img src=\"https://th.bing.com/th/id/OIP.If5z2FLNwcwbJL6Gd0l7nwHaEc?rs=1&amp;pid=ImgDetMain\" alt=\"Từ 1/7/2024, chỉ sử dụng duy nhất tài khoản VNeID Viet Nam Electronic ...\"></p><p>&nbsp;</p><p>&nbsp;Việc triển khai thí điểm nhằm mục đích đảm bảo việc triển khai thực hiện Sổ sức khỏe điện tử trên ứng dụng VNeID trên địa bàn tỉnh theo đúng chỉ đạo của Tổ công tác triển khai Đề án 06 của Chính phủ, Bộ Công an và Bộ Y tế. Ứng dụng công nghệ thông tin, chuyển đổi số nhằm kết nối các thông tin, dữ liệu điện tử hình thành trong quá trình khám, chữa bệnh của người dân tại các cơ sở khám, chữa bệnh công lập và tư nhân được cấp giấy phép hoạt động theo Luật Khám bệnh, chữa bệnh trên Sổ sức khỏe điện tử phục vụ công tác quản lý chuyên ngành Y tế được đầy đủ, chính xác, kịp thời; hỗ trợ công tác tổng hợp, phân tích thông tin dữ liệu, giúp việc dự báo, hoạch định chính sách, chỉ đạo hiệu quả về công tác bảo vệ, chăm sóc và nâng cao sức khỏe nhân dân.</p><p>Trên cơ sở khai thác,sử dụng các tiện ích từ Sổ sức khỏe điện tử giúp người dân có thể theo dõi, quản lý thông tin sức khỏe của bản thân liên tục, suốt đời; chủ động trong việc phòng bệnh, chăm sóc sức khỏe bản thân, giảm các chi phí khám, chữa bệnh tại các cơ sở y tế trên địa bàn tỉnh. Các thông tin sức khỏe y tế của người dân trên địa bàn tỉnh được theo dõi, quản lý thông qua dữ liệu số; được chia sẻ, kết nối với các cơ sở dữ liệu quốc gia, cơ sở dữ liệu chuyên ngành phục vụ nhu cầu giải quyết công việc, thủ tục hành chính của người dân, doanh nghiệp và các cơ quan, đơn vị trên địa bàn tỉnh.</p><p>&nbsp;</p><p>Nội dung triển khai, bao gồm: Xây dựng và tổ chức triển khai việc hiển thị thông tin Sổ sức khỏe điện tử cá nhân trên ứng dụng VneID, trong đó: Tổ chức kết nối, liên thông giữa Sổ sức khỏe điện tử với ứng dụng VNeID do Bộ Công an được giao quản lý để hiển thị thông tin sức khỏe cá nhân theo đúng các trường thông tin tại Quyết định số 1332/QĐ-BYT ngày 21/5/2024 của Bộ Y tế và phù hợp với văn bản thay đổi bổ sung, điều chỉnh mới; Thông tin sức khỏe cá nhân được hiển thị trên ứng dụng VNeID là dữ liệu chính thống, đủ cơ sở pháp lý phục vụ cho việc khám chữa bệnh ban đầu của người dân tại cơ sở y tế trên địa bàn tỉnh, thay cho các giấy tờ truyền thống; Tổ chức hướng dẫn thực hiện Sổ sức khỏe điện tử phục vụ tích hợp trên ứng dụng VNeID theo các hướng dẫn tại Quyết định số 2733/QĐ-BYT ngày 17/9/2024 của Bộ Y tế.</p><p>&nbsp;</p><p>Đồng thời, đánh giá tiến độ triển khai, cụ thể :Đánh giá kết quả việc thực hiện hiển thị thông tin sức khỏe cá nhân trên ứng dụng VNeID (Quyết định số 1332/QĐ-BYT ngày 21/5/2024) và phù hợp với văn bản thay đổi bổ sung mới: - Thời hạn đánh giá: Trước ngày mùng 3 hàng tháng và theo yêu cầu của Tổ Công tác triển khai Đề án 06 của Chính phủ. - Thực hiện đánh giá hiệu quả, các vấn đề vướng mắc, khó khăn và các vấn đề cần báo cáo, xin ý kiến, đề xuất và khuyến nghị thực hiện.</p><p>&nbsp;</p><p><strong>Lộ trình triển khai bao gồm 02 giai đoạn:</strong></p><p>&nbsp;</p><p><strong>Giai đoạn 1:</strong> Hoàn thành xây dựng ban hành Kế hoạch triển khai Sổ sức khỏe điện tử trên ứng dụng VNeID và các văn bản chỉ đạo điều hành theo Đề án 06; Rà soát và cấp mã cơ sở khám, chữa bệnh cho các cơ sở trong tỉnh chưa có mã; Kết nối, chia sẻ thông tin sức khỏe của người dân trên địa bàn tỉnh lên ứng dụng VNeID của Bộ Công an; Tổ chức thông tin, tuyên truyền về Sổ sức khỏe điện tử trên ứng dụng VNeID cho người dân.&nbsp; Thời gian hoàn thành giai đoạn 01 trước ngày 31/12/2024.</p><p>&nbsp;</p><p><strong>Giai đoạn 2:</strong> Triển khai tập huấn, hướng dẫn các cơ sở khám bệnh, chữa bệnh trong tỉnh liên thông dữ liệu lên Cổng tiếp nhận dữ liệu giám định BHYT; cập nhật kết quả khám, chữa bệnh người dân trên địa bàn tỉnh đi khám tại các cơ sở khám, chữa bệnh công lập và ngoài công lập trên địa bàn tỉnh lên Sổ Sức khỏe điện tử. Tổ chức kiểm tra, giám sát tiến độ, đánh giá kết quả triển khai áp dụng tại các cơ sở khám, chữa bệnh trên địa bàn tỉnh. Thời gian thực hiện theo hướng dẫn của Bộ Y tế và Bộ Công an.</p><p>&nbsp;</p><p>Để triển khai thí điểm Sổ sức khỏe điện tử tích hợp trên ứng dụng VNeID trên địa bàn tỉnh Ninh Bình đảm bảo tiến độ, chất lượng đúng yêu cầu đã đề ra, UBND tỉnh yêu cầu các trường thông tin, dữ liệu để tạo lập Sổ sức khỏe điện tử, hiển thị trên các ứng dụng phục vụ người dân, cần đảm bảo tuân thủ theo Quyết định số 1332/QĐ- BYT ngày 21/5/2024 của Bộ Y tế về việc ban hành Sổ sức khỏe điện tử phục vụ tích hợp trên ứng dụng VNeID và Bộ Công an;&nbsp; đảm bảo tuyệt đối an toàn, an ninh thông tin trong quá trình lưu trữ, khai thác dữ liệu Sổ sức khỏe điện tử của người dân; không để thất thoát, lộ lọt và sử dụng dữ liệu vào mục đích bất hợp pháp..</p>', 0, '<p><strong>Vừa qua, UBND tỉnh ban hành Kế hoạch số 192/KH-UBND về việc triển khai thí điểm Sổ sức khỏe điện tử tích hợp trên ứng dụng VNeID trên địa bàn tỉnh Ninh Bình.</strong></p><p>&nbsp;</p>', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cate`
--

DROP TABLE IF EXISTS `cate`;
CREATE TABLE IF NOT EXISTS `cate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `cate`
--

INSERT INTO `cate` (`id`, `name`) VALUES
(1, 'Tin tức Quốc tế'),
(2, 'Du Lịch - Dịch Vụ'),
(3, 'Thông Tin Quy Hoạch'),
(4, 'Cải Cách Hành Chính'),
(5, 'Phổ Biến Pháp Luật'),
(6, 'Thông Tin - Tin Tức'),
(7, 'Văn Hóa - Xã Hội'),
(8, 'Quốc Phòng - An Ninh'),
(9, 'Kinh Tế');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_number` varchar(255) NOT NULL,
  `issued_date` date NOT NULL,
  `excerpt` text,
  `attachment_url` varchar(255) DEFAULT NULL,
  `signer` varchar(255) DEFAULT NULL,
  `document_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_type_id` (`document_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `document_number`, `issued_date`, `excerpt`, `attachment_url`, `signer`, `document_type_id`) VALUES
(10, '193/KH-UBND', '2024-11-01', 'Kế hoạch triển khai thực hiện Chỉ thị số 20-CT/TU, ngày 10/10/2024 của Ban Thường vụ Tỉnh ủy về tăng cường công tác trồng, chăm sóc và bảo vệ cây xanh trên địa bàn tỉnh Ninh Bình', '/ProjectOJT/pdf/193.pdf', 'Trần Song Tùng', 1),
(6, '807/QĐ-UBND', '2024-11-04', 'Quyết định v/v phê duyệt Kế hoạch tổ chức lập Chương trình phát triển đô thị thành phố Tam Điệp đến năm 2045', '/ProjectOJT/pdf/807.pdf', 'Nguyễn Cao Sơn', 2),
(7, '963/QĐ-UBND', '2024-11-01', 'Quyết định Ban hành Danh mục văn bản quy phạm pháp luật của Ủy ban nhân dân tỉnh quy định chi tiết, hướng dẫn thi hành Luật Đường bộ, Luật Trật tự an toàn giao thông đường bộ', '/ProjectOJT/pdf/963.pdf', 'Nguyễn Cao Sơn', 5),
(8, '196/KH-UBND', '2024-11-04', 'Kế hoạch triển khai thực hiện Chỉ thị số 30/CT-TTg ngày 29/8/2024 của Thủ tướng Chính phủ về phát triển các ngành công nghiệp văn hóa trên địa bàn tỉnh Ninh Bình.', '/ProjectOJT/pdf/196.pdf', 'Tống Quang Thìn', 1),
(9, '968/QĐ-UBND', '2024-11-01', 'Quyết định phê chuẩn kết quả bầu chức vụ Chủ tịch Ủy ban nhân dân huyện Yên Khánh, nhiệm kỳ 2021-2026', '/ProjectOJT/pdf/968.pdf', 'Phạm Quang Ngọc', 2),
(11, '808/QĐ-UBND', '2024-11-04', 'Quyết định Phê duyệt đồ án Quy hoạch chi tiết tỷ lệ 1/500 khu dân cư thôn Thượng và thôn Hệ, xã Ninh Vân, huyện Hoa Lư.', '/ProjectOJT/pdf/808qđ.pdf', 'Trần Song Tùng', 1),
(13, '706/UBND-VP7', '2024-11-04', 'V/v triển khai hướng dẫn của BQP về công tác tuyển chọn và gọi công dân nhập ngũ năm 2025', '/ProjectOJT/pdf/706.pdf', 'Tống Quang Thìn', 5);

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

DROP TABLE IF EXISTS `document_types`;
CREATE TABLE IF NOT EXISTS `document_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `document_types`
--

INSERT INTO `document_types` (`id`, `name`) VALUES
(1, 'Kế hoạch'),
(2, 'Quyết định'),
(3, 'Chỉ thị'),
(4, 'Nghị định'),
(5, 'Công văn'),
(6, 'Hướng dẫn'),
(7, 'Khác');

-- --------------------------------------------------------

--
-- Table structure for table `du_lich_dich_vu`
--

DROP TABLE IF EXISTS `du_lich_dich_vu`;
CREATE TABLE IF NOT EXISTS `du_lich_dich_vu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `published_date` date NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `content` text,
  `is_featured` tinyint(1) DEFAULT '0',
  `excerpt` text,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `du_lich_dich_vu`
--

INSERT INTO `du_lich_dich_vu` (`id`, `title`, `url`, `published_date`, `image_url`, `content`, `is_featured`, `excerpt`, `category_id`) VALUES
(4, 'Khách Quốc tế đến Việt Nam tăng trưởng tích cực', 'khach-quoc-te-den-viet-nam-tang-truong-tich-cuc', '2024-10-04', 'https://file1.dangcongsan.vn/data/0/images/2024/07/29/upload_2675/z5637751819517-9fcd7cda97e7baa5b0d53f0c42913201.jpg', '', 0, '', 2),
(17, 'Khai mạc Lễ hội Khinh khí cầu Tràng An-Cúc Phương năm 2024', 'khai-mac-le-hoi-khinh-khi-cau-trang-an-cuc-phuong-nam-2024', '2024-10-28', 'https://apibeta.baoninhbinh.org.vn/user-blob/15088545-560b-d200-1fa2-cc31adda5a44/2024/10/26/22.jpg', '<p>&nbsp;</p><p>&nbsp;</p><p><img src=\"https://apibeta.baoninhbinh.org.vn/user-blob/15088545-560b-d200-1fa2-cc31adda5a44/2024/10/26/1.jpg\" alt=\"Quang cảnh khai mạc Lễ hội Khinh khí cầu Tràng An-Cúc Phương năm 2024. Ảnh: Minh Đường\"></p><p><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Quang cảnh khai mạc Lễ hội Khinh khí&nbsp;</i></p><p>&nbsp;</p><p>Dự lễ khai mạc có các đồng chí: Đoàn Minh Huấn, Ủy viên Trung ương Đảng, Bí thư Tỉnh ủy; Tống Quang Thìn, Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch Thường trực UBND tỉnh; Trần Song Tùng, Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh; các đồng chí Ủy viên Ban Thường vụ Tỉnh ủy; lãnh đạo các sở, ban, ngành, UBND các huyện, thành phố; đại diện một số tập đoàn, doanh nghiệp, công ty du lịch, lữ hành trong và ngoài tỉnh; đông đảo nhân dân, du khách gần xa.</p><p><img src=\"https://apibeta.baoninhbinh.org.vn/user-blob/15088545-560b-d200-1fa2-cc31adda5a44/2024/10/26/dbieu.jpeg\" alt=\"\"></p><p><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Các đại biểu dự khai mạc Lễ hội Khinh khí cầu Tràng An-Cúc Phương năm 2024.&nbsp;</i></p><p>&nbsp;</p><p><img src=\"https://apibeta.baoninhbinh.org.vn/user-blob/15088545-560b-d200-1fa2-cc31adda5a44/2024/10/26/dbieu1.jpeg\" alt=\"\"></p><p><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Các đại biểu dự khai mạc Lễ hội Khinh khí cầu Tràng An-Cúc Phương năm 2024</i></p><p>&nbsp;</p><p>Phát biểu tại Lễ khai mạc, lãnh đạo Sở Du lịch cho biết, đây là lần đầu tiên Lễ hội Khinh khí cầu được tổ chức tại Ninh Bình. Sự kiện này nằm trong chuỗi các hoạt động Văn hóa Du lịch hấp dẫn chào mừng Kỷ niệm 10 năm Quần thể Danh thắng Tràng An được UNESCO được ghi danh là Di sản Văn hoá và Thiên nhiên thế giới (2014 - 2024).&nbsp;</p><p><img src=\"https://apibeta.baoninhbinh.org.vn/user-blob/15088545-560b-d200-1fa2-cc31adda5a44/2024/10/26/manh.jpeg\" alt=\"\"></p><p><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Lãnh đạo Sở Du lịch phát biểu tại Lễ khai mạc.</i></p><p>&nbsp;</p><p>Với chủ đề “Tuyệt sắc miền Cố đô”, Lễ hội diễn ra từ ngày 26/10 đến 29/10, có quy mô 35 khinh khí cầu và dù lượn được điều khiển bởi phi công nước ngoài và Câu lạc bộ Dù lượn thành phố Hà Nội. Ban tổ chức cũng mong muốn sẽ mang lại cho nhân dân và du khách những trải nghiệm ấn tượng, cảm giác thú vị, khó quên khi được ngắm nhìn từ trên cao không gian, cảnh quan tươi đẹp, hùng vĩ của Di sản Văn hóa và Thiên nhiên thế giới Tràng An; thành phố Hoa Lư - đô thị di sản thiên niên kỷ trong tương lai.</p><p><img src=\"https://apibeta.baoninhbinh.org.vn/user-blob/15088545-560b-d200-1fa2-cc31adda5a44/2024/10/26/db.jpeg\" alt=\"\"></p><p><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Các đại biểu bấm nút khai mạc Lễ hội Khinh khí cầu Tràng An-Cúc Phương năm 2024.</i></p><p>&nbsp;</p><p>Trong khuôn khổ Lễ hội, du khách còn được hòa mình vào không gian sôi động của những bữa tiệc âm nhạc, biểu diễn ánh sáng, thời trang, nghệ thuật hấp dẫn; thăm gian hàng trưng bày giới thiệu sản phẩm OCOP đặc trưng vùng miền... Bên cạnh đó, khám phá, tìm hiểu về các nét văn hoá đặc trưng của địa phương, được thưởng thức các món ẩm thực mang hương vị đặc sắc của vùng đất Cố đô và tham quan, trải nghiệm các dịch vụ đẳng cấp tại các khu, điểm du lịch nổi tiếng của Ninh Bình.</p><p><img src=\"https://apibeta.baoninhbinh.org.vn/user-blob/15088545-560b-d200-1fa2-cc31adda5a44/2024/10/26/tang.jpeg\" alt=\"\"></p><p><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Lãnh đạo Sở Du lịch tặng hoa và giấy chứng nhận cho các nhà tài trợ</i></p><p>&nbsp;</p><p>Lễ hội nhằm tạo ra sản phẩm du lịch mới hiện đại, đặc sắc, độc đáo, góp phần đa dạng hóa sản phẩm du lịch, tạo sức hấp dẫn, thu hút đông đảo nhân dân, du khách trong nước và quốc tế. Đồng thời tăng cường quảng bá hình ảnh thương hiệu điểm đến du lịch, văn hóa, con người, tiềm năng, lợi thế phát triển, xây dựng Ninh Bình trở thành trung tâm du lịch quốc gia, quốc tế và là điểm đến của các Lễ hội bốn mùa. …</p><p>&nbsp;</p>', 1, '<p><strong>Sáng 26/10, tại Công viên Văn hóa Tràng An (thành phố Ninh Bình), Sở Du lịch tổ chức khai mạc Lễ hội Khinh khí cầu Tràng An-Cúc Phương với chủ đề “Tuyệt sắc miền Cố đô” năm 2024.</strong></p>', 2),
(16, 'Số lượt khách đến thăm quan tại các điểm du lịch trên địa bàn tỉnh tháng 10 ước đạt trên 386,5 nghìn lượt khách', 'so-luot-khach-den-tham-quan-tai-cac-diem-du-lich-tren-dia-ban-tinh-thang-10-uoc-dat-tren-3865-nghin-luot-khach', '2024-10-22', 'https://storage-vnportal.vnpt.vn/nbh-ubnd/2476/anhbai/nam2023/4-3-.jpg', '<p>&nbsp;</p><figure class=\"image image-style-align-center\"><img src=\"https://storage-vnportal.vnpt.vn/nbh-ubnd/2476/anhbai/nam2023/4-3-.jpg\" alt=\"anh tin bai\"></figure><p><br>Doanh thu du lịch tháng 10 ước đạt trên 511,7 tỷ đồng, tăng 9,66% so với cùng kỳ năm trước, trong đó: Hoạt động lưu trú ước đạt trên 71,6 tỷ đồng, tăng 2,78%; hoạt động nhà hàng ước đạt trên 261 tỷ đồng, tăng 12,60%; hoạt động vận chuyển ước đạt trên 60,7 tỷ đồng, tăng 6,16%; vé tham quan ước đạt trên 32,5 tỷ đồng, tăng 24,73%; bán hàng hóa, quà lưu niệm ước đạt trên 33,6 tỷ đồng, tăng 5,86%; các dịch vụ khác doanh thu ước đạt trên 52,1 tỷ đồng, tăng 4,22%</p>', 0, '<p><strong>Hoạt động du lịch trên địa bàn toàn tỉnh tháng 10 năm 2024 tiếp tục diễn ra sôi động, thời tiết tại Ninh Bình tháng 10 được đánh giá là dễ chịu và thoáng mát nhất trong năm, đây là điều kiện thuận lợi để du khách đến tham quan, do đó lượng khách du lịch trên địa bàn tỉnh ước tính tiếp tục tăng so với cùng kỳ năm trước.</strong></p>', 2),
(18, 'Hơn 4 vạn khách tham quan Bảo tàng Lịch sử Quân sự, đại lộ Thăng Long ùn tắc', 'hon-4-van-khach-tham-quan-bao-tang-lich-su-quan-su-dai-lo-thang-long-un-tac', '2024-11-11', 'https://static-images.vnncdn.net/vps_images_publish/000001/000003/2024/11/10/12-bao-tang-15-58576.jpg?width=0&s=T2w5StKtkOiHP8t6xoMDQg', '<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Bảo tàng Lịch sử Quân sự Việt Nam được đầu tư xây dựng từ năm 2019 trên diện tích 386.600m2 với thiết kế hiện đại và đa dạng công năng. Tổng mức đầu tư cho công trình khoảng 2.500 tỷ đồng.</p><p>&nbsp;</p><p>Kiến trúc của Bảo tàng Lịch sử Quân sự Việt Nam không chỉ là nơi trưng bày những hiện vật lịch sử chiến tranh, mà còn mở ra một không gian trải nghiệm và tương tác sống động, giúp khách tham quan hiểu sâu hơn về cuộc đấu tranh giành độc lập của Quân đội nhân dân Việt Nam anh hùng.</p><p>&nbsp;</p><p>Bảo tàng hiện đang lưu giữ hơn 150.000 hiện vật, trong đó có 4 bảo vật quốc gia cùng nhiều hiện vật quý giá khác. Để mang đến trải nghiệm mới mẻ cho khách tham quan, bảo tàng áp dụng nhiều phương pháp trưng bày hiện đại, như công nghệ sa bàn 3D mapping, màn hình tra cứu thông tin, tài liệu media, thuyết minh tự động audio guide, mã QR để tra cứu thông tin hiện vật và hình ảnh. Hơn 60 video clip giới thiệu về các chiến dịch, trận đánh và nhân vật lịch sử cũng được tích hợp, tạo nên một không gian sống động và đầy cảm xúc.</p><p>&nbsp;</p><p>Diện mạo mới của Bảo tàng Lịch sử Quân sự Việt Nam gồm khu nhà bảo tàng nổi bật với tòa tháp Chiến thắng cao 45m và khu vực sân trước. Khối nhà chính của bảo tàng có 4 tầng nổi, 1 tầng trệt, với diện tích xây dựng 23.198m2 và tổng diện tích sàn lên tới 64.640m2, chiều cao tổng thể đạt 35,8m.</p><p>&nbsp;</p><p>Ngay trong ngày đầu tiên, rất đông khách trong nước và quốc tế, trong đó có nhiều bạn trẻ, đã tới tham quan bảo tàng.</p><p>&nbsp;</p><p>Dưới đây là một số hình ảnh tại Bảo tàng Lịch sử Quân sự Việt Nam do phóng viên Báo Quân đội nhân dân ghi nhận sáng 1-11:</p><p>&nbsp;</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://file3.qdnd.vn/data/images/0/2024/11/01/upload_2058/11.jpg?dpi=150&amp;quality=100&amp;w=870\" alt=\"Rất đông khách tham quan Bảo tàng Lịch sử Quân sự Việt Nam trong ngày đầu tiên mở cửa\"></figure></td></tr><tr><td>Trong sáng 1-11, rất đông khách tham quan đã tới Bảo tàng Lịch sử Quân sự Việt Nam tại địa chỉ mới. Trong ảnh là một góc khu trưng bày hiện vật ngoài trời của bào tàng.&nbsp;</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://file3.qdnd.vn/data/images/0/2024/11/01/upload_2058/10.jpg?dpi=150&amp;quality=100&amp;w=870\" alt=\"Rất đông khách tham quan Bảo tàng Lịch sử Quân sự Việt Nam trong ngày đầu tiên mở cửa\"></figure></td></tr><tr><td>Nhiều hiện vật quý miêu tả hành trình dựng nước và giữ nước của dân tộc.&nbsp;</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://file3.qdnd.vn/data/images/0/2024/11/01/upload_2058/9.jpg?dpi=150&amp;quality=100&amp;w=870\" alt=\"Rất đông khách tham quan Bảo tàng Lịch sử Quân sự Việt Nam trong ngày đầu tiên mở cửa\"></figure></td></tr><tr><td>Các bạn trẻ quan tâm tới một hiện vật đặc biệt trong kháng chiến chống Mỹ, cứu nước.&nbsp;</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://file3.qdnd.vn/data/images/0/2024/11/01/upload_2088/bt%20lsqs%201.jpg?dpi=150&amp;quality=100&amp;w=870\" alt=\"Rất đông khách tham quan Bảo tàng Lịch sử Quân sự Việt Nam trong ngày đầu tiên mở cửa\"></figure></td></tr><tr><td>Nhân dịp bảo tàng mở cửa, nhiều gia đình đã đến tham quan tìm hiểu thêm về lịch sử quân sự Việt Nam.&nbsp;&nbsp;</td></tr></tbody></table></figure><p><br>&nbsp;</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://file3.qdnd.vn/data/images/0/2024/11/01/upload_2058/7.jpg?dpi=150&amp;quality=100&amp;w=870\" alt=\"Rất đông khách tham quan Bảo tàng Lịch sử Quân sự Việt Nam trong ngày đầu tiên mở cửa\"></figure></td></tr><tr><td>Nhiều tầng lớp nhân dân tới tham quan bảo tàng.&nbsp;</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://file3.qdnd.vn/data/images/0/2024/11/01/upload_2058/12.jpg?dpi=150&amp;quality=100&amp;w=870\" alt=\"Rất đông khách tham quan Bảo tàng Lịch sử Quân sự Việt Nam trong ngày đầu tiên mở cửa\"></figure></td></tr><tr><td>Không gian rộng lớn và kiến trúc đặc biệt của Bảo tàng Lịch sử Quân sự Việt Nam.</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://file3.qdnd.vn/data/images/0/2024/11/01/upload_2058/8.jpg?dpi=150&amp;quality=100&amp;w=870\" alt=\"Rất đông khách tham quan Bảo tàng Lịch sử Quân sự Việt Nam trong ngày đầu tiên mở cửa\"></figure></td></tr><tr><td>Sự kỳ vĩ của Tháp Chiến thắng.&nbsp;</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://file3.qdnd.vn/data/images/0/2024/11/01/upload_2058/4.jpg?dpi=150&amp;quality=100&amp;w=870\" alt=\"Rất đông khách tham quan Bảo tàng Lịch sử Quân sự Việt Nam trong ngày đầu tiên mở cửa\"></figure></td></tr><tr><td>Nổi bật ở sảnh chính bảo tàng là chiếc MiG-21 mang số hiệu 4324 có biệt danh \"Én bạc\", trên vỏ&nbsp;được in hình 14 ngôi sao màu đỏ, thể hiện đã tiêu diệt 14 máy bay địch.&nbsp;</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://file3.qdnd.vn/data/images/0/2024/11/01/upload_2058/5.jpg?dpi=150&amp;quality=100&amp;w=870\" alt=\"Rất đông khách tham quan Bảo tàng Lịch sử Quân sự Việt Nam trong ngày đầu tiên mở cửa\"></figure></td></tr><tr><td>Ngay trong ngày đầu tiên, có nhiều du khách quốc tế đã tới tham quan bảo tàng.&nbsp;</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://file3.qdnd.vn/data/images/0/2024/11/01/upload_2088/5.jpg?dpi=150&amp;quality=100&amp;w=870\" alt=\"Rất đông khách tham quan Bảo tàng Lịch sử Quân sự Việt Nam trong ngày đầu tiên mở cửa\"></figure></td></tr><tr><td>Nhiều bạn trẻ có mặt sớm để khám phá Bảo tàng Lịch sử Quân sự Việt Nam.&nbsp;</td></tr></tbody></table></figure><p><br>&nbsp;</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://file3.qdnd.vn/data/images/0/2024/11/01/upload_2088/bt%20lsqs%203.jpg?dpi=150&amp;quality=100&amp;w=870\" alt=\"Rất đông khách tham quan Bảo tàng Lịch sử Quân sự Việt Nam trong ngày đầu tiên mở cửa\"></figure></td></tr><tr><td>Nhiều bạn nhỏ cũng được đi tham quan.&nbsp;</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://file3.qdnd.vn/data/images/0/2024/11/01/upload_2088/9.jpg?dpi=150&amp;quality=100&amp;w=870\" alt=\"Rất đông khách tham quan Bảo tàng Lịch sử Quân sự Việt Nam trong ngày đầu tiên mở cửa\"></figure></td></tr><tr><td>Khu vực tái hiện ký ức lịch sử khiến nhiều khách tham quan thích thú.&nbsp;</td></tr></tbody></table></figure><p><br>&nbsp;</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://file3.qdnd.vn/data/images/0/2024/11/01/upload_2058/2.jpg?dpi=150&amp;quality=100&amp;w=870\" alt=\"Rất đông khách tham quan Bảo tàng Lịch sử Quân sự Việt Nam trong ngày đầu tiên mở cửa\"></figure></td></tr><tr><td>Ứng dụng công nghệ đồ họa mới trong hoạt động trưng bày tại bảo tàng.&nbsp;</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://file3.qdnd.vn/data/images/0/2024/11/01/upload_2058/15.jpg?dpi=150&amp;quality=100&amp;w=870\" alt=\"Rất đông khách tham quan Bảo tàng Lịch sử Quân sự Việt Nam trong ngày đầu tiên mở cửa\"></figure></td></tr><tr><td>Chia sẻ với Báo Quân đội nhân dân, Trung tá QNCN Nguyễn Thị Lan Hương, Trưởng phòng Tuyên truyền-giáo dục, Bảo tàng Lịch sử Quân sự Việt Nam cho biết, đơn vị đã chuẩn bị những điều kiện tốt nhất để phục vụ khách tham quan. Đặc biệt, bảo tàng đã sử dụng các nền tảng số để quảng bá và đưa các hình ảnh về hiện vật tới gần hơn với công chúng. Nhiều bạn trẻ đã biết tới&nbsp;Bảo tàng Lịch sử Quân sự Việt Nam và tới tham quan khi biết thông tin từ các nền tảng mạng xã hội.</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://file3.qdnd.vn/data/images/0/2024/11/01/upload_2088/bt%20lsqs%205.jpg?dpi=150&amp;quality=100&amp;w=870\" alt=\"Rất đông khách tham quan Bảo tàng Lịch sử Quân sự Việt Nam trong ngày đầu tiên mở cửa\"></figure></td></tr><tr><td>Chiếc xe tăng T54B số hiệu 843 - một trong các bảo vật quốc gia được trưng bày tại bảo tàng.&nbsp;&nbsp;</td></tr></tbody></table></figure><p><br>&nbsp;</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://file3.qdnd.vn/data/images/0/2024/11/01/upload_2058/13.jpg?dpi=150&amp;quality=100&amp;w=870\" alt=\"Rất đông khách tham quan Bảo tàng Lịch sử Quân sự Việt Nam trong ngày đầu tiên mở cửa\"></figure></td></tr><tr><td>Dự kiến,&nbsp;Bảo tàng Lịch sử Quân sự Việt Nam mở cửa miễn phí từ ngày 1-11 tới hết tháng 12-2024.</td></tr></tbody></table></figure>', 1, '<h2><strong>Lượng khách lớn đổ về Bảo tàng Lịch sử Quân sự mới ở quận Nam Từ Liêm (Hà Nội) tham quan trong ngày thứ 10 mở cửa miễn phí khiến bên trong đông nghẹt, phía ngoài đại lộ Thăng Long ùn tắc kéo dài.</strong></h2>', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `footers`
--

DROP TABLE IF EXISTS `footers`;
CREATE TABLE IF NOT EXISTS `footers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `footers`
--

INSERT INTO `footers` (`id`, `content`) VALUES
(1, '<h2>TRANG THÔNG TIN ĐIỆN TỬ</h2><p>&nbsp;</p><p>Chịu trách nhiệm: Trưởng Ban biên tập Đ/c ABC - &nbsp;Địa chỉ Gmail: admin@gmail.com&nbsp;</p><p>Địa chỉ: Số 60, đường Hải Thượng Lãn Ông, phường Phúc Thành - Thành phố Ninh Bình - Tỉnh Ninh Bình</p><p>Số điện thoại: 0123.456.789&nbsp;- Email: abc@gmail.com&nbsp;</p>');

-- --------------------------------------------------------

--
-- Table structure for table `kinh_te`
--

DROP TABLE IF EXISTS `kinh_te`;
CREATE TABLE IF NOT EXISTS `kinh_te` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `published_date` date NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `content` text,
  `is_featured` tinyint(1) DEFAULT '0',
  `excerpt` text,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `kinh_te`
--

INSERT INTO `kinh_te` (`id`, `title`, `url`, `published_date`, `image_url`, `content`, `is_featured`, `excerpt`, `category_id`) VALUES
(3, 'Lũ quét gây nhiều thiệt hại tại Nghệ An', 'lu-quet-gay-nhieu-thiet-hai-tai-nghe-an', '2024-10-03', 'https://file1.dangcongsan.vn/data/0/images/2024/10/01/upload_2676/luquet3.jpg', '<p>Lũ quét gây nhiều thiệt hại tại Nghệ An khiến nhiều người dân sống trong cảnh ....</p>', 0, '', 9),
(4, 'Quý IV năm 2024 phấn đấu thêm 12 xã đạt chuẩn NTM nâng cao', 'quy-iv-nam-2024-phan-dau-them-12-xa-dat-chuan-ntm-nang-cao', '2024-10-11', 'https://info-imgs.vgcloud.vn/2020/09/27/13/bao-hinh-thanh-the-nao-vi-sao-mat-bao-lai-la-noi-binh-yen-nhat.jpg', '<p>avccbbbbbbbbbbbbbbbbbbb</p>', 0, '', 9),
(15, 'Hội thảo:” Các tiến bộ của công nghệ dữ liệu và dữ liệu số trong phát triển kinh tế số”', 'hoi-thao-cac-tien-bo-cua-cong-nghe-du-lieu-va-du-lieu-so-trong-phat-trien-kinh-te-so', '2024-10-31', 'https://storage-vnportal.vnpt.vn/nbh-ubnd/2455/2023/anhdaidien/EF85B087-29A3-460A-B675-C85E76D66A01.jpeg', '<p>Dự Hội thảo có&nbsp;Đồng chí Đoàn Minh Huấn, Ủy viên Trung ương Đảng, Bí thư Tỉnh ủy Ninh Bình phát biểu tại Diễn đàn; lãnh đạo các bộ, ngành trung ương có liên quan; lãnh lãnh đạo đại diện các ngành, địa phương trông tỉnh.<br><br><img src=\"https://storage-vnportal.vnpt.vn/nbh-ubnd/2455/2023/anhdaidien/EF85B087-29A3-460A-B675-C85E76D66A01.jpeg\" alt=\"anh tin bai\"><br><br>Các chuyên đề tại Hội thảo sẽ phân tích các giải pháp nhằm giúp doanh nghiệp, cơ quan nhà nước khai thác dữ liệu một cách hiệu quả và an toàn, bao gồm các giải pháp tiên tiến giúp bảo vệ dữ liệu trước những nguy cơ xâm nhập, từ đó đảm bảo an toàn cho hệ thống dữ liệu của cả doanh nghiệp lẫn chính phủ.&nbsp;<br>&nbsp;</p><p><img src=\"https://storage-vnportal.vnpt.vn/nbh-ubnd/2455/2023/anhdaidien/68E79C51-43A0-4518-B7C4-C4A6677A2AFB.jpeg\" alt=\"anh tin bai\"><br><br>Với mục tiêu giúp các doanh nghiệp và cơ quan quản lý tối ưu hoá quy trình vận hành, giảm chi phí và tăng cường khả năng tương tác giữa các hệ thống dữ liệu khác nhau. Hội thảo sẽ đề cập đến việc ứng dụng dữ liệu và công nghệ số trong các lĩnh vực quan trọng như giáo dục, y tế và nông nghiệp, các&nbsp;chuyên gia sẽ chia sẻ về các mô hình chuyển đổi số giúp cải thiện chất lượng giáo dục, nâng cao hệ thống y tế và hỗ trợ nông nghiệp phát triển bền vững, thông minh , đồng thời giúp nâng cao chất lượng dịch vụ mà còn góp phần tạo ra sự thay đổi toàn diện về phương thức quản lý và phát triển, đặc biệt là trong bối cảnh phát triển nông thôn thông minh.<br>&nbsp;</p><p>VIETNAM DATAFEST 2024 với sự tham gia của Đại diện Lãnh đạo các Bộ, ngành, địa phương; Các chuyên gia trong nước và quốc tế về công nghệ, nông nghiệp, du lịch, dịch vụ, giáo dục, y tế…; Các doanh nghiệp, hợp tác xã sản xuất, chế biến nông nghiệp, dịch vụ, du&nbsp;lịch và các doanh nghiệp lớn, start up tiêu biểu; Tổ chức tài chính, các nhà đầu tư quỹ đầu tư về công nghệ, công nghiệp, nông nghiệp, du lịch, khởi nghiệp đổi mới sáng tạo. Đài phát thanh truyền hình, cơ quan báo chí Trung ương và địa phương.<br>&nbsp;</p><p>Vietnam DataFest 2024 là sự kiện chiến lược giúp Ninh Bình nắm bắt xu hướng công nghệ và dữ liệu mới nhất, từ đó giải quyết các bài toán lớn trong việc triển khai chuyển đổi số. Các diễn đàn và hội thảo sẽ mang lại những phương án cụ thể giúp địa phương phát triển kinh tế số, đồng thời nâng cao khả năng quản lý dữ liệu, bảo vệ an toàn thông tin và thúc đẩy các ngành kinh tế chủ chốt.<br>&nbsp;</p><p>Ninh Bình, với sự hỗ trợ của các chuyên gia và doanh nghiệp trong nước và quốc tế, đang hướng tới việc trở thành địa phương dẫn đầu trong chuyển đổi số. Sự kiện này sẽ tạo ra tiền đề vững chắc cho Ninh Bình trong hành trình đổi mới và phát triển, không chỉ về mặt công nghệ mà còn trong các lĩnh vực kinh tế - xã hội khác. Với nhiều hoạt động đa dạng và phong phú, VIETNAM DATAFEST 2024 sẽ tiếp tục phát huy những thành tựu này, đẩy mạnh các sáng kiến và hợp tác để giải quyết các thách thức trong phát triển Cách mạng Công nghiệp 4.0 và Chuyển đổi số quốc gia.<br>&nbsp;</p><p>Chương trình hứa hẹn sẽ đem lại những giá trị thiết thực, Vietnam Data Fest 2024 sẽ là bệ phóng mạnh mẽ giúp Ninh Bình và các tỉnh thành khác đi đầu trong ứng dụng công nghệ dữ liệu và chuyển đổi số, tạo nên những bước phát triển bền vững cho nền kinh tế số của cả nước.</p>', 1, '<p><strong>Chiều 24/10/2024 diễn ra Hội&nbsp;thảo nằm trong khuôn khổ sự &nbsp;kiện&nbsp;VIETNAM DATAFEST 2024&nbsp;sẽ đi sâu vào các tiến bộ mới nhất trong công nghệ dữ liệu và công nghệ số, bao gồm những đổi mới về kiến trúc dữ liệu, bảo mật dữ liệu, điện toán đám mây (cloud computing) và thế hệ trung tâm dữ liệu (data center) mới.</strong></p>', 9);

-- --------------------------------------------------------

--
-- Table structure for table `latest_news`
--

DROP TABLE IF EXISTS `latest_news`;
CREATE TABLE IF NOT EXISTS `latest_news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `published_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `url` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT '0',
  `excerpt` text,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `latest_news`
--

INSERT INTO `latest_news` (`id`, `title`, `content`, `published_date`, `url`, `image_url`, `is_featured`, `excerpt`, `category_id`) VALUES
(27, 'Lùi thời điểm tắt sóng 2G thêm 1 tháng để khắc phục hậu quả bão số 3', '<p><br>&nbsp;<br>&nbsp;</p><p>Theo Thông tư số 10, lý do để tạm ngưng là nhằm bảo đảm nhu cầu thông tin trong thời gian cần thiết đủ để doanh nghiệp và người dân kịp thời&nbsp;<a href=\"https://nhandan.vn/chu-de/tap-trung-cuu-nan-cuu-tro-dong-bao-bi-lu-lut-sau-bao-so-3-yagi-704816.html\">khắc phục thiệt hại cơn bão số 3</a>.</p><p>Còn hơn 3 triệu thuê bao 2G chưa kịp chuyển đổi<br>&nbsp;</p><p>Chiều 13/9, chia sẻ tại họp báo thường kỳ tháng 9 của Bộ Thông tin và Truyền thông do Thứ trưởng Nguyễn Thanh Lâm chủ trì, ông Nguyễn Phong Nhã, Phó Cục trưởng Cục Viễn thông cho biết, hiện nay, các nhà mạng di động đã hết sức nỗ lực để chuyển đổi thuê bao 2G only.<br>&nbsp;</p><p>Đến ngày 8/9, các nhà mạng còn khoảng 3,4 triệu thuê bao 2G only. So với tháng 7, trong vòng hơn 1 tháng, số thuê bao 2G only giảm hơn 5,3 triệu thuê bao.</p><p>&nbsp;</p><p>Đây là một kết quả rất đáng ghi nhận, thể hiện sự chỉ đạo quyết liệt của Bộ Thông tin và Truyền thông và sự nghiêm túc của các doanh nghiệp di động để thực hiện kế hoạch dừng công nghệ 2G theo Thông tư số 03, Thông tư số 04 về quy hoạch các băng tần số.</p><p>&nbsp;</p><p>Ông Nguyễn Phong Nhã cho biết, hiện nay, trong giai đoạn \"nước rút\" các nhà mạng đã và đang triển khai các giải pháp nhằm chuyển đổi các thuê bao 2G only còn lại trên mạng.</p><p>&nbsp;</p><p>Cụ thể, thực hiện hỗ trợ kinh phí máy điện thoại 4G only kết hợp các gói cước chuyển đổi, đồng thời hỗ trợ lên tới 100% kinh phí máy điện thoại 4G phím bấm. Các nhà mạng đều chuẩn bị 1 số lượng máy điện thoại 4G để hỗ trợ bù máy (100% kinh phí) cho các thuê bao 2G only của mình.</p><p>&nbsp;</p><p>Bên cạnh việc truyền thông trên các phương tiện truyền thông đại chúng, các nhà mạng đẩy mạnh thực hiện truyền thông trực tiếp tới khách hàng, đồng thời tăng tần suất truyền thông, thông qua các hình thức: gọi điện, nhắn tin SMS, thông báo nhà chờ cuộc gọi, phát IVR kèm cuộc gọi, call bot về các chương trình hỗ trợ chuyển đổi của doanh nghiệp và hướng dẫn khách hàng đổi máy.</p><p>&nbsp;</p><p>Các nhà mạng thực hiện truyền thông thông qua hệ thống truyền thông cơ sở (loa truyền thanh xã, phường) để cung cấp thông tin đến từng khách hàng.</p><p>&nbsp;</p><p>Để triển khai hiệu quả đến người dân ở vùng nông thôn, vùng sâu, vùng xa, một số doanh nghiệp di động còn thực hiện chiến dịch chuyển đổi tại tất cả các xã/phường, huy động toàn bộ lực lượng nhân viên tại tỉnh/thành phố tiếp xúc với khách hàng 2G đến từng nhà của thuê bao.<br>&nbsp;</p><p>Nhiều thuê bao 2G only nằm trong khu vực bị ảnh hưởng của bão, lụt<br>&nbsp;</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://storage-vnportal.vnpt.vn/nbh-ubnd/2312/NEW/2024/09/9.205.jpeg\" alt=\"anh tin bai\"></figure><p><br>Mặc dù cơ quan quản lý nhà nước, doanh nghiệp triển khai các chính dịch truyền thông rộng khắp trên các phương tiện truyền thông đại chúng, các doanh nghiệp truyền thông trực tiếp đến khách hàng, nhưng theo phản ánh của doanh nghiệp di động vẫn còn một bộ phận người sử dụng còn tâm lý chưa vội chuyển đổi thiết bị đầu cuối, gây khó khăn cho các nhà mạng trong việc tổ chức hỗ trợ chuyển đổi để bảo đảm quyền lợi của người sử dụng.<br>&nbsp;</p><p>Đối với các thuê bao này, cần tiếp tăng cường truyền thông trực tiếp để thực hiện chuyển đổi sang máy điện thoại 4G để bảo đảm tiếp tục sử dụng dịch vụ sau ngày 16/9.</p>', '2024-10-25 15:03:31', 'lui-thoi-diem-tat-song-2g-them-1-thang-de-khac-phuc-hau-qua-bao-so-3', 'https://storage-vnportal.vnpt.vn/nbh-ubnd/2312/NEW/2024/09/9.205.jpeg', 1, '<p><strong>Bộ Thông tin và Truyền thông ban hành&nbsp;</strong><a href=\"https://image.nhandan.vn/Uploaded/2024/unqxwpejw/2024_09_13/10tt-2319.pdf\"><strong>Thông tư số 10/2024/TT-BTTTT</strong></a><strong>&nbsp;ngày 13/9, thông báo “Ngưng hiệu lực thi hành quy định tại điểm a khoản 2 Điều 4 Thông tư số 03/2024/TT-BTTTT và điểm a khoản 2 Điều 4 Thông tư số 04/2024/TT- BTTTT” về việc dừng cung cấp dịch vụ cho thiết bị đầu cuối thuê bao chỉ hỗ trợ tiêu chuẩn GSM trong thời hạn 1 tháng (từ ngày 16/9 đến hết ngày 15/10).</strong></p>', 1),
(4, 'Triển khai dự án điện mặt trời tại huyện Kim Sơn', '<p>Dự án điện mặt trời lớn tại huyện Kim Sơn đã được triển khai, góp phần vào phát triển năng lượng sạch cho tỉnh Ninh Bình.</p>', '2024-09-20 14:30:00', 'trien-khai-du-an-dien-mat-troi-tai-huyen-kim-son', ' ', 0, '', 1),
(6, 'Chương trình trao tặng học bổng cho học sinh nghèo tại Yên Mô', '<p>Ngày 10/09, UBND huyện Yên Mô đã tổ chức trao tặng học bổng cho các học sinh có hoàn cảnh khó khăn, tiếp thêm động lực cho các em trong năm học mới.</p>', '2024-09-10 11:00:00', 'chuong-trinh-trao-tang-hoc-bong-cho-hoc-sinh-ngheo-tai-yen-mo', '', 0, '', 1),
(9, 'Hội thảo công nghệ cao trong sản xuất nông nghiệp tại Ninh Bình', '<p>Hội thảo về ứng dụng công nghệ cao trong sản xuất nông nghiệp đã diễn ra tại Ninh Bình, nhằm nâng cao hiệu quả sản xuất và bảo vệ môi trường.</p>', '2024-09-23 13:30:00', 'hoi-thao-cong-nghe-cao-trong-san-xuat-nong-nghiep-tai-ninh-binh', '', 0, '', 1),
(34, 'Hai nhân vật cấp cao của phong trào Hồi giáo Jihad và Hezbollah thiệt mạng', '<p><img src=\"https://image.sggp.org.vn/w680/Uploaded/2024/fcivpivp/2024_11_11/screenshot-2024-11-11-at-083143-6601.png.webp\" alt=\"Hiện trường vụ tấn công của Israel vào thị trấn Almat ở quận Jbeil, Lebanon. Ảnh: REUTERS\"></p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Hiện trường vụ tấn công của Israel vào thị trấn Almat ở quận Jbeil, Lebanon.</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Ảnh: REUTERS</p><p>&nbsp;</p><p>Theo tuyên bố chung được đưa ra ngày 10-11, lực lượng an ninh Israel mô tả Abu Sakhil là “một nhân vật quan trọng” trong tổ chức Hồi giáo Jihad, chịu trách nhiệm lập kế hoạch và điều phối các cuộc tấn công, trong đó có các hoạt động chung với Hamas chống lại quân đội Israel ở Gaza.</p><p>&nbsp;</p><p>Cùng ngày, cổng thông tin Naharnet của Lebanon đưa tin Ali Mousa Dakduk, chỉ huy cấp cao của lực lượng Hezbollah, đã thiệt mạng trong cuộc không kích của Israel vào khu phố Sayyidah Zaynab ở thủ đô Damascus, Syria.</p><p>&nbsp;</p><p>Theo Naharnet, Ali Mousa Dakduk là người phụ trách hoạt động của Hezbollah chống lại Israel ở Syria. Nhân vật này đã phối hợp hành động với các nhóm vũ trang Shiite thuộc phong trào Kháng chiến Hồi giáo ở Iraq và chỉ đạo các cuộc tấn công pháo kích vào Cao nguyên Golan.</p><p>&nbsp;</p><p>Trong khi đó, hãng thông tấn SANA dẫn một nguồn tin trong Bộ Quốc phòng Syria cho biết Israel đã tấn công các vùng ngoại ô phía Đông Nam của Damascus bằng tên lửa phóng từ Cao nguyên Golan bị chiếm đóng, làm 9 dân thường thiệt mạng và 20 người khác bị thương. Kênh truyền hình Al Hadath đưa tin 3 thành viên Hezbollah ẩn náu trong ngôi nhà bị nhắm mục tiêu đã thiệt mạng.</p><p>&nbsp;</p><p>Trong một diễn biến khác, cùng ngày, Thủ tướng Israel Benjamin Netanyahu lần đầu tiên chính thức thừa nhận về vụ tấn công nhằm vào Hezbollah hồi tháng 9, trong đó hàng ngàn máy nhắn tin cầm tay phát nổ trên khắp Lebanon và Syria.</p>', '2024-11-11 09:33:02', 'hai-nhan-vat-cap-cao-cua-phong-trao-hoi-giao-jihad-va-hezbollah-thiet-mang', 'https://image.sggp.org.vn/w680/Uploaded/2024/fcivpivp/2024_11_11/screenshot-2024-11-11-at-083143-6601.png.webp', 0, '<p><i><strong>Quân đội Israel và cơ quan an ninh nội địa nước này Shin Bet tuyên bố Muhammad Abu Sakhil, người chỉ huy các chiến dịch của nhóm vũ trang Hồi giáo Jihad đã thiệt mạng trong cuộc không kích vào Dải Gaza.</strong></i></p>', NULL),
(19, 'Khai trương Trung tâm y tế mới tại thành phố Tam Điệp', '<p>Trung tâm y tế mới tại thành phố Tam Điệp đã chính thức khai trương, cung cấp các dịch vụ y tế chất lượng cao cho người dân.</p>', '2024-09-19 08:00:00', 'khai-truong-trung-tam-y-te-moi-tai-thanh-pho-tam-iep', ' ', 0, '', 1),
(33, 'Bán dẫn Trung Quốc đối mặt nguy cơ khủng hoảng thừa', '<p>Nhóm công nghiệp chip quốc tế SEMI dự báo chi tiêu cho thiết bị sản xuất chip ở Trung Quốc sẽ giảm trung bình 4% trong giai đoạn 2023 - 2027.&nbsp;</p><p>&nbsp;</p><p>Cũng theo tổ chức này, chi tiêu cho thiết bị sản xuất chip tại Trung Quốc sẽ vượt 40 tỷ USD trong năm nay, sau đó giảm về mức của năm 2023 kể từ năm tới.</p><figure class=\"image\"><img src=\"https://img.freepik.com/premium-photo/semiconductor-manufacturing-with-robotic-arms_493806-15163.jpg\" alt=\"Premium Photo | Semiconductor manufacturing with robotic arms\"></figure><p>\"Vào năm 2025, thị trường Trung Quốc đại lục dự kiến ​​sẽ giảm 5-10% so với năm trước\", một giám đốc điều hành tại chi nhánh Trung Quốc của một nhà cung cấp thiết bị sản xuất chip quốc tế nói với <i>Nikkei Asia</i>.</p><p>&nbsp;</p><p>\"Tỷ lệ sử dụng thiết bị được giao cho các nhà máy <a href=\"https://vietnamnet.vn/ban-dan-tag2624506733201865884.html\">bán dẫn</a> ở Trung Quốc đang giảm và việc mua hàng vội vã trước đây là một phần dẫn đến thị trường thu hẹp vào năm 2025 trở đi\", giám đốc điều hành này nói thêm.</p><p>&nbsp;</p><p>Tại ASML Holding, nhà cung cấp thiết bị sản xuất chip lớn của Hà Lan, Trung Quốc chiếm khoảng 50% doanh số theo giá trị trong quý từ tháng 7 đến tháng 9. Tuy nhiên, ASML dự kiến ​​thị phần của Trung Quốc sẽ giảm xuống còn khoảng 20% ​​vào năm 2025.</p><p>&nbsp;</p><p>Theo SEMI, chi tiêu cho thiết bị sản xuất chip ở Trung Quốc đại lục sẽ giảm trung bình 4% từ năm 2023 đến năm 2027 xét về tốc độ tăng trưởng kép hằng năm.</p><p>&nbsp;</p><p>Ngược lại, chi tiêu ở châu Mỹ sẽ tăng 22% hằng năm trong cùng giai đoạn, đối với châu Âu và Trung Đông là tăng 19% và 18% tại Nhật Bản.</p><p>&nbsp;</p><p>Tuy nhiên, Trung Quốc đại lục vẫn là thị trường lớn nhất thế giới về thiết bị sản xuất chip. Dự kiến nước này ​​sẽ chi 144,4 tỷ USD cho thiết bị cho các nhà máy bán dẫn từ năm 2024 đến năm 2027.</p><p>&nbsp;</p><p>Chi phí này lớn hơn 108 tỷ USD của Hàn Quốc, 103,2 tỷ USD ở Đài Loan (Trung Quốc), 77,5 tỷ USD ở châu Mỹ và 45,1 tỷ USD của Nhật Bản.</p><p>&nbsp;</p><p><strong>Cung vượt cầu do chi tiêu ồ ạt</strong></p><p>&nbsp;</p><p>Một yếu tố góp phần vào khoản chi tiêu quá mức của Trung Quốc là mục tiêu tăng cường khả năng tự cung tự cấp trong ngành công nghiệp bán dẫn của chính phủ. Theo SEMI, tỷ lệ tự cung tự cấp của Trung Quốc vào năm 2023 chỉ là 23%.</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://media.datacenterdynamics.com/media/images/Centiel_DCD_Article_July.2e16d0ba.fill-1200x630.jpg\" alt=\"Uninterrupted power: The cornerstone of AI data centers - DCD\"></figure><p>&nbsp;</p><p>Chính phủ Trung Quốc muốn tiếp tục hỗ trợ ngành công nghiệp bán dẫn để thúc đẩy khả năng tự chủ công nghệ. Bởi vậy, các nhà cung cấp nước ngoài lớn tại đây phải đối mặt với sự cạnh tranh gay gắt từ các công ty địa phương.</p><p>&nbsp;</p><p>Việc đầu tư ồ ạt vào sản xuất chip có thể dẫn đến tình trạng dư thừa công suất, gây áp lực lên giá cả và lợi nhuận của các doanh nghiệp trong ngành.</p><p>&nbsp;</p><p>Mức chi tiêu khủng của nền kinh tế số hai thế giới đã đẩy tỷ lệ đầu tư vốn của ngành công nghiệp chip nước này lên trên 15% trong 4 năm liên tiếp kể từ năm 2021.</p><p>&nbsp;</p><p>Các chuyên gia trong ngành ước tính, nếu tỷ lệ này trên 15% có thể gây ra lo ngại về dư thừa nguồn cung dẫn đến giảm giá và ảnh hưởng đến lợi nhuận của các doanh nghiệp.</p><p>&nbsp;</p><p>Mới đây, SMIC đã phát đi cảnh báo về tình trạng dư thừa công suất với các chip node trưởng thành sẽ kéo dài đến năm 2025 và họ đang cân nhắc thận trọng về việc mở rộng công suất mới.</p><p>&nbsp;</p><p>\"Tỷ lệ sử dụng của ngành đang dao động quanh mức 70%, thấp hơn nhiều so với mức tối ưu là 85%, cho thấy tình trạng dư thừa công suất đáng kể. Tình hình này khó có thể cải thiện, nếu không muốn nói là có thể tồi tệ hơn nữa\", đồng giám đốc điều hành Zhao Haijun cho biết.</p><p>&nbsp;</p><p>Naura Technology Group thuộc sở hữu nhà nước là nhà cung cấp thiết bị sản xuất chip lớn nhất Trung Quốc. Advanced Micro-Fabrication Equipment (AMEC) là công ty lớn thứ hai. Cả hai đều đã cải thiện năng lực công nghệ với sự hỗ trợ của chính phủ.</p><p>&nbsp;</p><p>SMIC cùng các nhà sản xuất khác cũng đã được Bắc Kinh yêu cầu mua thiết bị đúc chip nội địa.</p><p>&nbsp;</p><p>Vào tháng 1, Mỹ đã thêm AMEC vào danh sách các công ty Trung Quốc có liên hệ với quân đội. Theo truyền thông đại lục, hai giám đốc điều hành có quốc tịch Mỹ đã từ chức khỏi AMEC kể từ tháng 9.</p>', '2024-11-11 09:22:38', 'ban-dan-trung-quoc-doi-mat-nguy-co-khung-hoang-thua', 'https://cdn.vnreview.vn/655360_70849780958278_1385689593675776?wt=0fec5d92d273ccf73e8177880753377c&rt=10fe434db4a10b9b3f2bab04c6151ee0&width=1080', 0, '<h2><strong>Chi tiêu dành cho thiết bị sản xuất chip của Trung Quốc dự báo sẽ giảm trung bình 4% mỗi năm từ giờ đến năm 2027, báo hiệu ngành công nghiệp bán dẫn nước này đang đứng trước nguy cơ cuộc khủng hoảng thừa.</strong></h2>', NULL),
(32, 'Tổng thống Mỹ kêu gọi Quốc hội và ông Trump không bỏ rơi Ukraine', '<p>Tổng thống Joe Biden sẽ lập luận rằng, Mỹ không nên bỏ rơi Ukraine vì động thái đó có thể gây ra nhiều bất ổn hơn ở châu Âu.</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://newsonlineng.com/wp-content/uploads/2024/06/presidential-debate-between-Donald-Trump-and-Joe-Biden.png\" alt=\"BREAKING: Donald Trump Wins US Presidential Election Debate\"></figure><p>&nbsp;</p><p>\"Trong 70 ngày tới, Tổng thống sẽ có cơ hội trình bày với Quốc hội và chính quyền mới rằng, nước Mỹ cần tiếp tục cung cấp nguồn lực cho Ukraine sau khi ông kết thúc nhiệm kỳ\", hãng BBC và CBS dẫn lời ông Jake Sullivan cho hay.&nbsp;</p><p>&nbsp;</p><p>Quan chức Nhà Trắng này nói, vấn đề trên sẽ là một trong số hàng loạt chủ đề được thảo luận khi ông Trump và Tổng thống Joe Biden gặp nhau tại Nhà Trắng vào thứ Tư (13/11) để bàn về các ưu tiên trong chính sách đối nội và đối ngoại.</p><p>&nbsp;</p><p>\"Tổng thống Joe Biden sẽ có cơ hội để giải thích với Tổng thống mới đắc cử Donald Trump về cách ông nhìn nhận mọi việc, quan điểm của cả hai và nói với ông Trump về cách ông suy nghĩ giải quyết các vấn đề khi nhậm chức\".&nbsp;</p><p>&nbsp;</p><p>Ông Jake Sullivan nói thêm, Tổng thống Joe Biden muốn đảm bảo việc chuyển giao quyền lực suôn sẻ và thảo luận các vấn đề toàn cầu quan trọng với Tổng thống mới.&nbsp;</p><p>&nbsp;</p><p>Trước đây, ông Trump đã chỉ trích mức hỗ trợ mà Mỹ dành cho Ukraine. Với việc đảng Cộng hòa đã kiểm soát Thượng viện và có khả năng là cả Hạ viện, việc đảm bảo các gói viện trợ trong tương lai cho Ukraine có thể là thách thức đối với chính quyền của Tổng thống Joe Biden.</p><p>&nbsp;</p><p>Kết quả của cuộc họp giữa ông Biden và ông Trump vào ngày 13/11 có thể có những tác động đáng kể đến sự tham gia trong tương lai của Mỹ vào cuộc xung đột Ukraine.&nbsp;</p>', '2024-11-11 09:05:01', 'tong-thong-my-keu-goi-quoc-hoi-va-ong-trump-khong-bo-roi-ukraine', 'https://static-images.vnncdn.net/vps_images_publish/000001/000003/2024/11/11/joe-biden-trump-epa-59796.jpg?width=0&s=s3f4ZbNIBFTugzrgrKdv4A', 0, '<h2><strong>Theo cố vấn an ninh quốc gia của Nhà Trắng Jake Sullivan, Tổng thống Joe Biden sẽ đưa ra lời kêu gọi với Quốc hội và Tổng thống mới đắc cử Donald Trump về vấn đề tài trợ cho Ukraine.</strong></h2>', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pho_bien_phap_luat`
--

DROP TABLE IF EXISTS `pho_bien_phap_luat`;
CREATE TABLE IF NOT EXISTS `pho_bien_phap_luat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `published_date` date NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `content` text,
  `is_featured` tinyint(1) DEFAULT '0',
  `excerpt` text,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pho_bien_phap_luat`
--

INSERT INTO `pho_bien_phap_luat` (`id`, `title`, `url`, `published_date`, `image_url`, `content`, `is_featured`, `excerpt`, `category_id`) VALUES
(4, 'Ninh Bình: Thực hiện mở rộng thí điểm cấp Phiếu lý lịch tư pháp qua ứng dụng VneID', 'ninh-binh-thuc-hien-mo-rong-thi-diem-cap-phieu-ly-lich-tu-phap-qua-ung-dung-vneid', '2024-10-11', 'https://storage-vnportal.vnpt.vn/nbh-ubnd/2476/anhbai/nam2023/z4689459110679-0b27475e84731e6a6e3291b5b5a3855f-608520240826154418.png', '', 0, '', 5),
(3, 'Mẫu thuẫn chia đất đai, dùng dao chém anh ruột tử vong', 'mau-thuan-chia-dat-dai-dung-dao-chem-anh-ruot-tu-vong', '2024-10-03', 'https://image-us.24h.com.vn/upload/2-2022/images/2022-06-24/2-1656053329-343-width740height555.jpg', '', 0, '', 5),
(5, 'Hội nghị trực tuyến lần thứ XI về chống khai thác hải sản bất hợp pháp, không báo cáo, không đúng quy định', 'hoi-nghi-truc-tuyen-lan-thu-xi-ve-chong-khai-thac-hai-san-bat-hop-phap-khong-bao-cao-khong-dung-quy-dinh', '2024-10-28', 'https://storage-vnportal.vnpt.vn/nbh-ubnd/2455/2023/anhdaidien/z5966211192216_0e8c55a86f34fbc1b7ea1be048abac74.jpg', '<figure class=\"table\"><table><tbody><tr><td><p><br>&nbsp;</p><figure class=\"table\"><table><tbody><tr><td><p>&nbsp;</p><p>&nbsp;</p><p><img src=\"https://storage-vnportal.vnpt.vn/nbh-ubnd/2455/2023/anhdaidien/z5966211821663_c90fbdb3f1d1501a4aa911e89a771647.jpg\" alt=\"anh tin bai\"></p><p><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Phó Chủ tịch UBND tỉnh Trần Song Tùng chủ trì Hội nghị tại điểm cầu Ninh Bình</i><br>&nbsp;</p><p>Tại điểm cầu Ninh Bình, Phó Chủ tịch UBND tỉnh Trần Song Tùng chủ trì Hội nghị. Cùng dự có&nbsp;lãnh đạo các sở, ngành, đơn vị; đại diện lãnh đạo UBND huyện Kim Sơn.</p><p>Tại hội nghị, Thứ trưởng Bộ NN&amp;PTNT Phùng Đức Tiến cho biết, sau 7 năm kiên trì triển khai các giải pháp đông bộ, chống khai thác IUU của cả nước đã thu được nhiều thành quả. Đó là các kết quả về xây dựng, hoàn thiện khung pháp lý; tăng cường công tác quản lý đội tàu, theo dõi, giám sát và kiểm soát tàu cá; thực hiện truy xuất nguồn gốc thủy sản khai thác chặt chẽ hơn; xử lý các hành vi khai thác IUU đạt được nhiều kết quả quan trọng.</p><p><img src=\"https://storage-vnportal.vnpt.vn/nbh-ubnd/2455/2023/anhdaidien/z5966554680316_96568549797c6c402028310bf227a7fb.jpg\" alt=\"anh tin bai\"></p><p><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Quang cảnh điểm cầu Ninh Bình</i><br>&nbsp;</p><p>Tuy nhiên, công tác chống khai thác IUU vẫn còn nhiều khó khăn. Tình trạng tàu cá vi phạm khai thác hải sản bất hợp pháp ở vùng biển nước ngoài tiếp tục diễn biến phức tạp, gia tăng hơn so với trước. Cụ thể, từ đầu năm đến nay, cả nước đã xảy ra 61 tàu/418 ngư dân bị nước ngoài bắt giữ, xử lý (tăng 12 tàu/16 ngư dân so với cùng kỳ năm 2023). Hiện nay còn 23/61 tàu chưa xác minh được do cố tình sử dụng số đăng ký giả, xóa số đăng ký hoặc tàu cá mua bán, chuyển nhượng chưa sang tên đổi chủ; cả nước còn 7.035 tàu cá không đăng ký, đăng kiểm, cấp phép (tàu cá “3 không”). Tình trạng mua bán, chuyển nhượng, sang tên đổi chủ tàu cá không thực hiện thủ tục xóa đăng ký, đăng ký lại tàu cá trong tỉnh và giữa các tỉnh vẫn diễn ra thường xuyên.</p><p><img src=\"https://storage-vnportal.vnpt.vn/nbh-ubnd/2455/2023/anhdaidien/z5966211192216_0e8c55a86f34fbc1b7ea1be048abac74.jpg\" alt=\"anh tin bai\"></p><p><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Quang cảnh điểm cầu Ninh Bình</i></p><p>&nbsp;</p><p>Tình trạng tàu cá vi phạm khai thác bất hợp pháp ngày càng tinh vi bằng nhiều thủ đoạn như sử dụng tàu cá có chiều dài dưới 15m không lắp thiết bị giám sát hành trình (GSHT); cố tình ngắt GSHT khi hoạt động gần khu vực vùng biển giáp ranh; cố tình gửi, vận chuyển thiết bị GSHT trên tàu cá khác. Từ đầu năm đến nay đã phát hiện 8 vụ/8 tàu vận chuyển 74 thiết bị GSHT của tàu cá khác thuộc tỉnh Kiên Giang, Bà Rịa Vũng Tàu.</p><p>Vẫn còn tình trạng tàu cá không đủ điều kiện vẫn ra vào cảng, xuất nhập bến tham gia hoạt động khai thác thủy sản; tiếp tục xảy ra tình trạng tàu cá không cập cảng bốc dỡ sản phẩm thủy sản khai thác tại nhiều địa phương. Chất lượng nhật ký khai thác vẫn chưa đảm bảo, chủ yếu là hồi ký, ghi lại theo dữ liệu GSHT, chỉ ghi mẻ lưới khai thác ở vùng khơi trong khi trên thực tế qua đối chiếu qua GSHT có hoạt động khai thác ở vùng lộng…</p><p>Các cơ quan của bộ NN&amp;PTNT đang rà soát, nâng cấp, hoàn thiện hệ thống cơ sở dữ liệu thông tin nghề cá quốc gia để theo dõi, quản lý dữ liệu từ Trung ương đến địa phương và giữa các lực lượng chức năng của các bộ, ngành có liên quan. Ngành chức năng đang rà soát, sửa đổi, bổ sung các quy định pháp luật thủy sản trong việc đăng ký, cấp giấy phép khai thác thủy sản, đảm bảo đơn giản hóa thủ tục hành chính. Các cơ quan tổ chức cao điểm chiến dịch tuần tra, kiểm tra, kiểm soát, ngăn chặn, xử lý kịp thời tàu cá “3 không”, xử lý nghiêm tàu cá vi phạm pháp luật thủy sản trên biển.</p><p>Bộ NN&amp;PTNT đang chủ trì, phối hợp với các bộ, ngành, địa phương xây dựng, chuẩn bị kỹ chương trình, kế hoạch, nội dung tổng thể làm việc với Đoàn Thanh tra của ủy ban châu Âu lần thứ 5; chuẩn bị kỹ các phương án đảm bảo tốt nhất, không để bị động, ảnh hưởng đến nỗ lực gỡ cảnh báo “thẻ vàng” của cả nước.</p></td></tr></tbody></table></figure></td></tr></tbody></table></figure>', 1, '<p><strong>Chiều nay 25/10/2024, Phó Thủ tướng Chính phủ Trần Hồng Hà chủ trì Hội nghị trực tuyến lần thứ XI về chống khai thác hải sản bất hợp pháp, không báo cáo, không đúng quy định (khai thác IUU).</strong></p>', 5);

-- --------------------------------------------------------

--
-- Table structure for table `quoc_phong_an_ninh`
--

DROP TABLE IF EXISTS `quoc_phong_an_ninh`;
CREATE TABLE IF NOT EXISTS `quoc_phong_an_ninh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `published_date` date NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `content` text,
  `is_featured` tinyint(1) DEFAULT '0',
  `excerpt` text,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `quoc_phong_an_ninh`
--

INSERT INTO `quoc_phong_an_ninh` (`id`, `title`, `url`, `published_date`, `image_url`, `content`, `is_featured`, `excerpt`, `category_id`) VALUES
(3, '02/10/2024 Tiếp tục thực hiện tốt Quy chế phối hợp trong công tác bảo vệ an ninh quốc gia, bảo đảm trật tự an toàn xã hội tại các KCN trên địa bàn tỉnh', '02102024-tiep-tuc-thuc-hien-tot-quy-che-phoi-hop-trong-cong-tac-bao-ve-an-ninh-quoc-gia-bao-dam-trat-tu-an-toan-xa-hoi-tai-cac-kcn-tren-dia-ban-tinh', '2024-10-03', 'https://anhdephd.vn/wp-content/uploads/2022/06/anh-cong-an-nhan-thuong.jpg', '', 0, '', 8),
(4, '2 ngày đầu ra quân, kiểm tra, xử lý 150 trường hợp vi phạm trật tự ATGT trong lứa tuổi học sinh', '2-ngay-dau-ra-quan-kiem-tra-xu-ly-150-truong-hop-vi-pham-trat-tu-atgt-trong-lua-tuoi-hoc-sinh', '2024-10-11', 'https://img.baoninhbinh.org.vn/DATA/ARTICLES/2024/10/3/2-ngay-dau-ra-quan-kiem-tra-xu-ly-150-truong-hop-vi-pham-296a4.jpg', '', 0, '', 8);

-- --------------------------------------------------------

--
-- Table structure for table `thong_tin_quy_hoach`
--

DROP TABLE IF EXISTS `thong_tin_quy_hoach`;
CREATE TABLE IF NOT EXISTS `thong_tin_quy_hoach` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `published_date` date NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `content` text,
  `is_featured` tinyint(1) DEFAULT '0',
  `excerpt` text,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `thong_tin_quy_hoach`
--

INSERT INTO `thong_tin_quy_hoach` (`id`, `title`, `url`, `published_date`, `image_url`, `content`, `is_featured`, `excerpt`, `category_id`) VALUES
(3, '30/09/2024 Không khí lạnh tràn về, Bắc Bộ giảm nhiệt, mưa to đến rất to', '30092024-khong-khi-lanh-tran-ve-bac-bo-giam-nhiet-mua-to-den-rat-to', '2024-10-09', '\\ProjectOJT\\img\\khucongnghiepmoi.jpg', '', 0, '', 3),
(5, 'Hội nghị rà soát, triển khai Kế hoạch tổ chức Festival lần thứ III năm 2024', 'hoi-nghi-ra-soat-trien-khai-ke-hoach-to-chuc-festival-lan-thu-iii-nam-2024', '2024-10-31', 'https://storage-vnportal.vnpt.vn/nbh-ubnd/2453/2024/Anhbai/z5979437164294_4fd60aabfdb7bd02f21f2764df0b58bd.jpg', '<p>&nbsp;</p><p><img src=\"https://storage-vnportal.vnpt.vn/nbh-ubnd/2453/2024/Anhbai/z5979437164294_4fd60aabfdb7bd02f21f2764df0b58bd.jpg\" alt=\"anh tin bai\"></p><p><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Quang cảnh Hội nghị&nbsp;</i></p><p>&nbsp;</p><p>Tiếp nối thành công của Festival Ninh Bình năm 2023 - “ Sắc màu di sản - Hội tụ và lan tỏa”, tỉnh Ninh Bình tiếp tục tổ chức Festival Ninh Bình lần thứ III, năm 2024 với chủ đề “Dòng chảy di sản”&nbsp;là sự kiện văn hóa, du lịch có ý nghĩa quan trọng góp phần xây dựng và định vị thương hiệu đô thị di sản thiên niên kỷ của tỉnh nhằm đẩy mạnh các hoạt động giao lưu văn hóa, tôn vinh các di sản văn hóa và xúc tiến, quảng bá du lịch. Thông qua việc tổ chức Festival Ninh Bình 2024 góp phần quảng bá hình ảnh, di sản văn hóa, con người của tỉnh Ninh Bình và các vùng, miền trong cả nước đến bạn bè trong nước và quốc tế, phục vụ phát triển du lịch.</p><p>&nbsp;</p><p>Tại hội nghị, các đại biểu đã thảo luận, làm rõ những công việc đã và đang triển khai các sự kiện và hoạt động trọng tâm là: Chương trình khai mạc Festival; Lễ hội đường phố; Hội Quán “Dục Thúy Sơn”; chương trình nghệ thuật “Ninh Bình-Sao Mai hội tụ”; chương trình bế mạc Festival.<br>&nbsp;</p><p><img src=\"https://storage-vnportal.vnpt.vn/nbh-ubnd/2453/2024/Anhbai/z5979446654679_b9b9ffb06cf7b96c7a0886754ea667f1.jpg\" alt=\"anh tin bai\"></p><p><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Đồng chí&nbsp;Tống Quang Thìn, Phó Chủ tịch Thường trực UBND tỉnh phát biểu kết luận Hội nghị</i></p><p>&nbsp;</p><p>Phát biểu kết luận Hội nghị, đồng chí Tống Quang Thìn, Phó Chủ tịch Thường trực UBND tỉnh, Trưởng Ban Tổ chức Festival yêu cầu các thành viên Ban Tổ chức căn cứ chức năng, nhiệm vụ cụ thể của đơn vị khẩn trương triển khai thực hiện hiệu quả, đúng quy định; đảm bảo Festival Ninh Bình lần thứ III năm 2024 được tổ chức thành công với cách làm mới, quy mô lớn. Đặc biệt cần quan tâm làm tốt công tác thông tin tuyên truyền trực quan và trên các cơ quan thông tấn, báo chí, nền tảng mạng xã hội, mang lại hiệu ứng lan tỏa sâu rộng trong nhân dân và bạn bè trong nước, quốc tế.</p><p>&nbsp;</p><p>Đồng chí cũng thống nhất một số nội dung liên quan đến thời gian diễn ra lễ khai mạc; tổ chức họp báo về Festival và một số nội dung đến công tác đảm bảo an ninh trật tự, an toàn giao thông, đảm bảo điện, vệ sinh môi trường, An toàn thực phẩm, trang trí khánh tiết…quyết tâm tổ chức thành công Festival Ninh Bình năm 2024 xứng tầm, tôn vinh và phát huy giá trị di sản, xây dựng thương hiệu văn hóa riêng của Ninh Bình..</p>', 1, '<p><strong>Chiều 29/10/2024, Ban Tổ chức Festival Ninh Bình năm 2024 tổ chức Hội nghị rà soát, triển khai Kế hoạch tổ chức Festival. Đồng chí Tống Quang Thìn, Ủy viên BTV Tỉnh ủy, Phó Chủ tịch Thường trực UBND tỉnh, Trưởng Ban Tổ chức chủ trì Hội nghị. Cùng dự có các thành viên Ban Tổ chức Festival năm 2024.</strong></p>', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thong_tin_tin_tuc`
--

DROP TABLE IF EXISTS `thong_tin_tin_tuc`;
CREATE TABLE IF NOT EXISTS `thong_tin_tin_tuc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `published_date` date NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `content` text,
  `is_featured` tinyint(1) DEFAULT '0',
  `excerpt` text,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `thong_tin_tin_tuc`
--

INSERT INTO `thong_tin_tin_tuc` (`id`, `title`, `url`, `published_date`, `image_url`, `content`, `is_featured`, `excerpt`, `category_id`) VALUES
(3, 'Điện mừng kỷ niệm 75 năm ngày thành lập nước Cộng hòa nhân dân Trung Hoa', 'ien-mung-ky-niem-75-nam-ngay-thanh-lap-nuoc-cong-hoa-nhan-dan-trung-hoa', '2024-10-03', 'https://file1.dangcongsan.vn/data/0/images/2024/09/30/upload_21/mot-so-bieu-tuong-cua-trung-quoc-1.jpg', '', 0, '', 6),
(10, 'Thủ môn Văn Lâm cản phá thành công 2 quả 11m giúp Ninh Bình vào vòng 1/8 Cúp Quốc gia', 'thu-mon-van-lam-can-pha-thanh-cong-2-qua-11m-giup-ninh-binh-vao-vong-18-cup-quoc-gia', '2024-10-23', 'https://storage-vnportal.vnpt.vn/nbh-ubnd/2455/anhvanhoaxh/1DBBD6EB-64E6-4635-98D2-01394BC37A8E.jpeg', '<p><strong>&nbsp; &nbsp;&nbsp;</strong></p><p>&nbsp; Phù Đổng Ninh Bình trở thành CLB hạng Nhất giành quyền vào vòng 1/8 Cúp Quốc gia mùa giải năm nay.<br>Đội hình thi đấu<br>TP.HCM: Lê Giang, Thanh Thảo, Thanh Quý, Hạ Long, Hoàng Phúc, Vũ Tín, Huy Toàn, Vĩnh Nguyên, Ngọc Long, Thanh Khôi<br>Ninh Bình: Văn Lâm, Thanh Thịnh, Hữu Tuấn, Thành Lộc, Đức Việt, Ngọc Hà, Ngọc Lâm, Đức Cường, Hải Đức, Trần Văn Tùng, Thanh Bình.</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://storage-vnportal.vnpt.vn/nbh-ubnd/2455/anhvanhoaxh/1DBBD6EB-64E6-4635-98D2-01394BC37A8E.jpeg\" alt=\"anh tin bai\"></figure><p><br>&nbsp; &nbsp;Ở phút thứ 81 của trận đấu cầu thủ Thành Lộc &nbsp;của Ninh Bình nhận thẻ vàng thứ 2 và phải rời sân.&nbsp;<br>Hòa nhau không bàn thắng sau 90 phút chính thức, hai đội buộc phải giải quyết thắng thua ở loạt luân lưu 11m cân não.<br>Tại đây, thủ thành Đặng Văn Lâm xuất sắc cản phá thành công 2 quả penalty giúp Phù Đổng Ninh Bình giành chiến thắng với tỷ số 4-3 giành tấm vé vào vòng 1/8 Cúp Quốc gia 2024 .<br>&nbsp;</p>', 0, '<p><strong>Trận đấu chiều tối 20/10/2024, Thủ thành Đặng Văn Lâm xuất sắc cản phá thành công 2 quả penalty, giúp Phù Đồng Ninh Bình đánh bại TP.HCM 4-3 sau khi hai đội hòa 0-0 trong 90 phút chính thức.</strong></p>', 6),
(12, 'Bão Trà Mi di chuyển chậm và có khả năng suy yếu', 'bao-tra-mi-di-chuyen-cham-va-co-kha-nang-suy-yeu', '2024-10-28', 'https://file1.dangcongsan.vn/data/0/images/2024/10/25/upload_26/lien-bao.jpg?dpi=150&quality=100&w=800', '<p>&nbsp;</p><p>&nbsp;</p><figure class=\"table\"><table><tbody><tr><td><a href=\"https://file1.dangcongsan.vn/data/0/images/2024/10/25/upload_26/lien-bao.jpg\"><img src=\"https://file1.dangcongsan.vn/data/0/images/2024/10/25/upload_26/lien-bao.jpg?dpi=150&amp;quality=100&amp;w=800\" alt=\"\"></a></td></tr><tr><td><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Vị trí và hướng đi của bão ngày 25/10. Ảnh: TT KTTV</i></td></tr></tbody></table></figure><p>&nbsp;</p><p>&nbsp;Theo Trung tâm Dự báo khí tượng thủy văn Quốc gia, hồi 4 giờ ngày 25/10, vị trí tâm bão ở vào khoảng 17,0 độ Vĩ Bắc; 119,0 độ Kinh Đông, trên vùng biển phía Đông của khu vực Bắc Biển Đông. Sức gió mạnh nhất vùng gần tâm bão mạnh cấp 9-10 (75-102km/h), giật cấp 12. Di chuyển theo hướng Tây, tốc độ khoảng 10km/h.&nbsp;</p><p>Từ 4 giờ ngày 25/10 đến 4 giờ ngày 27/10, bão di chuyển chậm lại có khả năng đổi hướng Đông Nam mỗi giờ đi được 5-10km, sau có khả năng đổi hướng Đông, cường độ có suy yếu dần.</p><p>Do ảnh hưởng của bão, vùng biển phía Đông khu vực Bắc Biển Đông gió mạnh cấp 7, sau tăng lên cấp 8, vùng gần tâm bão đi qua cấp 9-10 (75-102km/h), giật cấp 12, sóng biển cao 5-7m, vùng gần tâm bão 7-9m; biển động rất mạnh.</p><p>Đêm ngày 25/10, vùng biển phía Đông của khu vực Bắc và Giữa Biển Đông có mưa bão; ở vùng biển phía Tây khu vực Bắc Biển Đông, khu vực Nam Biển Đông (bao gồm vùng biển khu vực Trường Sa), có mưa rào và dông rải rác, trong mưa dông có khả năng xảy ra lốc xoáy và gió giật mạnh cấp 7-8.</p><p>Cảnh báo, ngày và đêm 26/10: Khu vực Bắc Biển Đông (bao gồm vùng biển khu vực Hoàng Sa) gió mạnh cấp 9-10, vùng gần tâm bão đi qua cấp 11-12, giật cấp 15; sóng biển cao 6-8m, vùng gần tâm bão 8-10m; biển động dữ dội. Vùng biển phía Bắc khu vực giữa Biển Đông có gió mạnh cấp 7-8, giật cấp 9-10; biển động rất mạnh; sóng biển cao từ 5-7m. Khu vực Vịnh Bắc Bộ, vùng biển phía Nam của khu vực giữa biển Đông, khu vực Nam Biển Đông (bao gồm vùng biển khu vực Trường Sa) có gió mạnh cấp 6, có lúc cấp 7, giật cấp 8-9; biển động; sóng biển cao từ 3-6m. Khu vực biển từ Quảng Trị đến Quảng Ngãi (bao gồm vùng biển huyện đảo Lý Sơn), có gió mạnh cấp 6-7, sau tăng lên cấp 8-9, giật cấp 11; biển động rất mạnh; sóng biển cao từ 5-7m. Cấp độ rủi ro thiên tai do gió mạnh trên biển cấp 2, riêng phía Đông khu vực Bắc Biển Đông cấp 3.</p>', 1, '<p><strong>Dự báo từ 4 giờ hôm nay (25/10) đến 4 giờ ngày 27/10, bão Trà Mi di chuyển chậm lại có khả năng đổi hướng Đông Nam mỗi giờ đi được 5-10km, sau có khả năng đổi hướng Đông, cường độ có suy yếu dần.</strong></p>', 6),
(13, 'Vì sao \'tuần trăng mật\' của Microsoft và OpenAI kết thúc?', 'vi-sao-tuan-trang-mat-cua-microsoft-va-openai-ket-thuc', '2024-10-31', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhI8mkrWxjfCh5obx43KTI3wkChBck3F75H8QExY-lHMkmTjFJqrt_UYM6BayWoYHs28oa9oS9wd3TiDDAXZRF1qa9216T2uW30Wu4DiKA2F3EHHfqCHHaq55CUhkbUQPTT3Y3SdjqWUizotaQPuCeyCKVjIObJOkyr1meMRxDfbe2PMYuoJiDqectLWpo_/s1600', '<p>Microsoft là một trong những nhà đầu tư ban đầu của OpenAI, đặt nền móng cho sự phát triển và bùng nổ của ChatGPT, từ đó kéo theo cơn sốt AI đến tận ngày nay.</p><p>OpenAI nhanh chóng trở thành startup AI có ảnh hưởng và giá trị nhất thế giới.&nbsp;</p><p>Trong khi đó, gã khổng lồ Windows cũng vươn lên dẫn đầu thế giới về AI dựa vào các khoản đầu tư sớm này. Tổng cộng, Microsoft đã rót vốn hơn 13 tỷ USD vào startup AI đình đám.</p><p>Công ty cũng sử dụng ChatGPT làm cơ sở cho dòng công cụ Copilot. Nhờ vào việc sở hữu một phần OpenAI, Microsoft thu về hàng tỷ USD doanh thu.&nbsp;</p><p>Trong quá trình phát triển, hai công ty đã cùng vận động hành lang Quốc hội, cùng nhau vạch ra chiến lược và dường như đồng thuận về hầu hết mọi thứ.</p><p>Khi OpenAI lật đổ Sam Altman khỏi vị trí CEO vào năm ngoái, CEO Satya Nadella của Microsoft đã làm việc hậu trường để đưa nhà sáng lập này trở lại vị trí.</p><p>Hai công ty thân thiết đến mức Altman gọi mối quan hệ của họ là \"tình anh em tốt nhất trong công nghệ\".</p><p>&nbsp;</p><p><img src=\"https://cdn.analyticsvidhya.com/wp-content/uploads/2023/06/openai-vs-microsoft.png\" alt=\"Microsoft and OpenAI Clash Over AI Integration\"></p><p><br><br>Microsoft là một trong những nhà đầu tư ban đầu của OpenAI, đặt nền móng cho sự phát triển và bùng nổ của ChatGPT, từ đó kéo theo cơn sốt AI đến tận ngày nay.</p><p>OpenAI nhanh chóng trở thành startup AI có ảnh hưởng và giá trị nhất thế giới.&nbsp;</p><p>Trong khi đó, gã khổng lồ Windows cũng vươn lên dẫn đầu thế giới về AI dựa vào các khoản đầu tư sớm này. Tổng cộng, Microsoft đã rót vốn hơn 13 tỷ USD vào startup AI đình đám.</p><p>Công ty cũng sử dụng ChatGPT làm cơ sở cho dòng công cụ Copilot. Nhờ vào việc sở hữu một phần OpenAI, Microsoft thu về hàng tỷ USD doanh thu.&nbsp;</p><p>Trong quá trình phát triển, hai công ty đã cùng vận động hành lang Quốc hội, cùng nhau vạch ra chiến lược và dường như đồng thuận về hầu hết mọi thứ.</p><p>Khi OpenAI lật đổ Sam Altman khỏi vị trí CEO vào năm ngoái, CEO Satya Nadella của Microsoft đã làm việc hậu trường để đưa nhà sáng lập này trở lại vị trí.</p><p>Hai công ty thân thiết đến mức Altman gọi mối quan hệ của họ là \"tình anh em tốt nhất trong công nghệ\".</p><p><strong>“Một rừng không thể có hai hổ”</strong></p><p>Vào tháng 3, có thông tin cho thấy Altman và Giám đốc điều hành của OpenAI Brad Lightcap đã công khai cố gắng lôi kéo các doanh nghiệp rời khỏi Copilot của Microsoft và hướng tới Enterprise ChatGPT của OpenAI.</p><p>Cụ thể, Altman và Lightcap đã “tán tỉnh” hơn 300 giám đốc điều hành công ty tại New York, San Francisco và London, hạ thấp Microsoft bằng cách nói rằng, các doanh nghiệp có thể làm việc trực tiếp với những người đã xây dựng công nghệ genAI thay vì lấy công nghệ cũ từ Microsoft.</p><p>Trong khi đó, Nadella từng nói, \"Nếu OpenAI biến mất vào ngày mai… chúng tôi có tất cả các quyền sở hữu trí tuệ và tất cả các khả năng. Chúng tôi có con người, chúng tôi có máy tính, chúng tôi có dữ liệu, chúng tôi có mọi thứ\".</p><p>Khoản đầu tư 14 tỷ USD của Microsoft vào OpenAI bao gồm tiền mặt cũng như tài nguyên điện toán, đặc biệt là sức mạnh máy tính cần thiết để đào tạo và chạy công nghệ.</p><p>Khoản tiền mặt gần đây nhất được rót thêm là vào đầu tháng 10, khi OpenAI huy động được 6,6 tỷ USD từ các nhà đầu tư bao gồm nhiều ngân hàng, quỹ đầu tư, Microsoft và nhà sản xuất chip AI Nvidia.</p><p>Microsoft được cho là đã đầu tư 1 tỷ USD trong số đó. Sau vòng gọi vốn, OpenAI ước tính có giá trị là 157 tỷ USD.</p><p>Thế nhưng, vậy là chưa đủ đối với công ty sở hữu ChatGPT. Công ty này đang đốt tiền với tốc độ khủng khiếp - 5 tỷ USD mỗi năm và điều đó sẽ không sớm kết thúc.</p><p>Tờ New York Times đưa tin rằng, đến năm 2029, công ty sẽ chi 37,5 tỷ USD hàng năm cho chi phí điện toán, chi phí này chưa bao gồm tiền lương, tiền thuê nhà và tất cả các chi phí khác của công ty.</p><p>Do đó, OpenAI muốn Microsoft cung cấp cho mình nhiều sức mạnh tính toán hơn nữa. Và Microsoft đang chần chừ. Tờ Times lưu ý: \"Nhân viên OpenAI phàn nàn rằng Microsoft không cung cấp đủ sức mạnh tính toán. Và nếu một công ty khác đánh bại họ trong việc tạo ra AI phù hợp với bộ não con người, Microsoft sẽ phải chịu trách nhiệm, vì họ đã không cung cấp cho OpenAI sức mạnh tính toán mà họ cần\".</p><p>OpenAI hiện đang tìm kiếm những nơi khác để có được những nguồn lực đó. Họ đã ký một thỏa thuận trị giá gần 10 tỷ USD với Oracle.</p><p>Ngoài ra, Microsoft và OpenAI gần đây đã đàm phán lại mức giá trị sức mạnh tính toán của Microsoft, mặc dù không rõ liệu thỏa thuận mới có làm giảm hay tăng giá trị tài chính hay không.</p><p>Do những vấn đề trên, Microsoft đã phòng ngừa rủi ro không phụ thuộc quá nhiều vào OpenAI cho lộ trình AI tương lai.</p><p>Đáng chú ý, công ty đã trả hơn 650 triệu USD để thuê gần như toàn bộ nhân viên từ đối thủ cạnh tranh của OpenAI là Inflection.</p><p>Gã khổng lồ phần mềm cũng thuê cựu giám đốc điều hành và đồng sáng lập của Inflection, Mustafa Suleyman, để phụ trách các nỗ lực AI của Microsoft.</p><p>Suleyman và OpenAI đã có một số lần đụng độ, với Altman ngày càng khó chịu khi Suleyman được tuyển dụng.</p><p>Gil Luria, một nhà phân tích tại ngân hàng đầu tư D.A. Davidson nói với tờ Times, \"Microsoft có thể bị tụt hậu nếu chỉ sử dụng các công nghệ OpenAI. Đây là một cuộc đua thực sự và OpenAI có thể không giành chiến thắng\".</p><p><strong>“Một rừng không thể có hai hổ”</strong></p><p>Vào tháng 3, có thông tin cho thấy Altman và Giám đốc điều hành của OpenAI Brad Lightcap đã công khai cố gắng lôi kéo các doanh nghiệp rời khỏi Copilot của Microsoft và hướng tới Enterprise ChatGPT của OpenAI.</p><p>Cụ thể, Altman và Lightcap đã “tán tỉnh” hơn 300 giám đốc điều hành công ty tại New York, San Francisco và London, hạ thấp Microsoft bằng cách nói rằng, các doanh nghiệp có thể làm việc trực tiếp với những người đã xây dựng công nghệ genAI thay vì lấy công nghệ cũ từ Microsoft.</p><p>Trong khi đó, Nadella từng nói, \"Nếu OpenAI biến mất vào ngày mai… chúng tôi có tất cả các quyền sở hữu trí tuệ và tất cả các khả năng. Chúng tôi có con người, chúng tôi có máy tính, chúng tôi có dữ liệu, chúng tôi có mọi thứ\".</p><p>Khoản đầu tư 14 tỷ USD của Microsoft vào OpenAI bao gồm tiền mặt cũng như tài nguyên điện toán, đặc biệt là sức mạnh máy tính cần thiết để đào tạo và chạy công nghệ.</p><p>Khoản tiền mặt gần đây nhất được rót thêm là vào đầu tháng 10, khi OpenAI huy động được 6,6 tỷ USD từ các nhà đầu tư bao gồm nhiều ngân hàng, quỹ đầu tư, Microsoft và nhà sản xuất chip AI Nvidia.</p><p>Microsoft được cho là đã đầu tư 1 tỷ USD trong số đó. Sau vòng gọi vốn, OpenAI ước tính có giá trị là 157 tỷ USD.</p><p>Thế nhưng, vậy là chưa đủ đối với công ty sở hữu ChatGPT. Công ty này đang đốt tiền với tốc độ khủng khiếp - 5 tỷ USD mỗi năm và điều đó sẽ không sớm kết thúc.</p><p>Tờ New York Times đưa tin rằng, đến năm 2029, công ty sẽ chi 37,5 tỷ USD hàng năm cho chi phí điện toán, chi phí này chưa bao gồm tiền lương, tiền thuê nhà và tất cả các chi phí khác của công ty.</p><p>Do đó, OpenAI muốn Microsoft cung cấp cho mình nhiều sức mạnh tính toán hơn nữa. Và Microsoft đang chần chừ. Tờ Times lưu ý: \"Nhân viên OpenAI phàn nàn rằng Microsoft không cung cấp đủ sức mạnh tính toán. Và nếu một công ty khác đánh bại họ trong việc tạo ra AI phù hợp với bộ não con người, Microsoft sẽ phải chịu trách nhiệm, vì họ đã không cung cấp cho OpenAI sức mạnh tính toán mà họ cần\".</p><p>OpenAI hiện đang tìm kiếm những nơi khác để có được những nguồn lực đó. Họ đã ký một thỏa thuận trị giá gần 10 tỷ USD với Oracle.</p><p>Ngoài ra, Microsoft và OpenAI gần đây đã đàm phán lại mức giá trị sức mạnh tính toán của Microsoft, mặc dù không rõ liệu thỏa thuận mới có làm giảm hay tăng giá trị tài chính hay không.</p><p>Do những vấn đề trên, Microsoft đã phòng ngừa rủi ro không phụ thuộc quá nhiều vào OpenAI cho lộ trình AI tương lai.</p><p>Đáng chú ý, công ty đã trả hơn 650 triệu USD để thuê gần như toàn bộ nhân viên từ đối thủ cạnh tranh của OpenAI là Inflection.</p><p>Gã khổng lồ phần mềm cũng thuê cựu giám đốc điều hành và đồng sáng lập của Inflection, Mustafa Suleyman, để phụ trách các nỗ lực AI của Microsoft.</p><p>Suleyman và OpenAI đã có một số lần đụng độ, với Altman ngày càng khó chịu khi Suleyman được tuyển dụng.</p><p>Gil Luria, một nhà phân tích tại ngân hàng đầu tư D.A. Davidson nói với tờ Times, \"Microsoft có thể bị tụt hậu nếu chỉ sử dụng các công nghệ OpenAI. Đây là một cuộc đua thực sự và OpenAI có thể không giành chiến thắng\".</p>', 1, '<h2><strong>\'Ngọt ngào đến mấy cũng tan thành mây\', hai gã khổng lồ công nghệ trí tuệ nhân tạo Microsoft và OpenAI đang bước vào cuộc đối đầu khốc liệt.</strong></h2>', 6),
(16, 'Đưa AI, trợ lý ảo tiếp cận sớm với học sinh, thanh thiếu niên', 'ua-ai-tro-ly-ao-tiep-can-som-voi-hoc-sinh-thanh-thieu-nien', '2024-11-11', 'https://static-images.vnncdn.net/vps_images_publish/000001/000003/2024/11/10/xa-hoi-so-ky-nang-so-tre-em-2-59017.jpg?width=0&s=a87ODMitzHDezsZYVBRxmA', '<p>Sáng 10/11, Trung tâm Phát triển Khoa học, Công nghệ và Tài năng trẻ (Trung ương Đoàn Thanh niên Cộng sản Hồ Chí Minh) đã phối hợp cùng các đối tác tổ chức Ngày hội sáng tạo công nghệ năm 2024.&nbsp;</p><p>&nbsp;</p><p>Hoạt động này là một phần của phong trào “Tuổi trẻ sáng tạo” nhằm nâng cao nhận thức, phát huy tinh thần tiên phong, sáng tạo của thanh niên trong nghiên cứu, ứng dụng thành quả của cuộc cách mạng công nghiệp lần thứ 4, từ đó góp phần đẩy mạnh quá trình chuyển đổi số quốc gia</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://rtholdings.edu.vn/wp-content/uploads/2021/11/vr-giup-hoc-sinh-phat-trien-toan-dien-iedg-1.jpg\" alt=\"VR - &quot;Công nghệ ảo, lợi ích thật&quot; giúp học sinh phát triển toàn diện ...\"></figure><p>Trong lần thứ 5 được tổ chức, với chủ đề “Khai phá sức mạnh AI”, ngày hội đã giúp các bạn thanh thiếu nhi có cơ hội hiểu rõ nét và tiếp cận công cụ trí tuệ nhân tạo như trợ lý ảo một cách hiệu quả.</p><p>&nbsp;</p><p>Do đó, Ngày hội sáng tạo công nghệ năm 2024 đã thu hút đông đảo các bạn học sinh, sinh viên yêu thích công nghệ và đam mê sáng tạo tham gia.&nbsp;</p><p>&nbsp;</p><p>Ngày hội tổ hợp các hoạt động gồm: Không gian trải nghiệm STEM/STEAM, không gian trải nghiệm khoa học, công nghệ và thiên văn học, cuộc thi sáng tạo Robotics, cuộc thi “Sáng tạo cùng AI” để tạo ra sản phẩm với chủ đề “Trường học hạnh phúc”, cuộc thi “Lập trình cùng AI”; cuộc thi Rung chuông vàng với chủ đề “AI phục vụ cuộc sống”…</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://media.vneconomy.vn/w800/images/upload/2024/01/22/ai-in-education-1.jpg\" alt=\"Trường đại học đầu tiên trên thế giới hợp tác với OpenAI - Nhịp sống ...\"></figure><p>&nbsp;</p><p>Sự kiện cũng là sân chơi sáng tạo, giúp đoàn viên, thanh niên phát triển các <a href=\"https://vietnamnet.vn/20-trieu-thanh-nien-viet-nam-se-duoc-day-ky-nang-livestream-truc-tuyen-2339056.html\">kỹ năng mềm</a> như khả năng làm việc nhóm, kỹ năng thuyết trình, kỹ năng phản biện… thúc đẩy phát triển giáo dục STEM, các kiến thức về khoa học, công nghệ và đổi mới sáng tạo, tìm hiểu và ứng dụng công cụ AI tạo sinh để hỗ trợ học tập và giảng dạy.</p>', 0, '<h2><strong>Với chủ đề “Khai phá sức mạnh AI”, Ngày hội sáng tạo công nghệ năm 2024 đã giúp các bạn trẻ hiểu và tiếp cận công cụ trợ lý ảo, trí tuệ nhân tạo.</strong></h2>', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `email`) VALUES
(3, 'admin', '$2y$10$fhTQ9Atqz7Hf8otxA9x7Les9rztkWHmvJ3kfjr2SAaqksJmbl.Wvi', 'ADMIN', 'e'),
(4, 'hello', '$2y$10$U7vm8AiPHTH/EnWmrTMvzumxdZz199AJOEoHaE/uS.b572DJVhFBS', ' ', ' ');

-- --------------------------------------------------------

--
-- Table structure for table `van_hoa_xa_hoi`
--

DROP TABLE IF EXISTS `van_hoa_xa_hoi`;
CREATE TABLE IF NOT EXISTS `van_hoa_xa_hoi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `published_date` date NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `content` text,
  `is_featured` tinyint(1) DEFAULT '0',
  `excerpt` text,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `van_hoa_xa_hoi`
--

INSERT INTO `van_hoa_xa_hoi` (`id`, `title`, `url`, `published_date`, `image_url`, `content`, `is_featured`, `excerpt`, `category_id`) VALUES
(4, 'Triển khai các nhiệm vụ phối hợp tổ chức chương trình âm nhạc \"The music of ABBA\"', 'trien-khai-cac-nhiem-vu-phoi-hop-to-chuc-chuong-trinh-am-nhac-the-music-of-abba', '2024-10-11', 'https://img.baoninhbinh.org.vn/DATA/ARTICLES/2024/10/4/baa-55e17.jpg', '', 0, '', 7),
(5, 'FC Hội Doanh nhân trẻ tỉnh vô địch Giải bóng đá Tứ hùng năm ', 'fc-hoi-doanh-nhan-tre-tinh-vo-dich-giai-bong-da-tu-hung-nam', '2024-10-11', 'https://img.baoninhbinh.org.vn/DATA/ARTICLES/2024/10/6/bd--dc3ee.JPG', '', 0, '', 7);

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
CREATE TABLE IF NOT EXISTS `votes` (
  `option_id` int NOT NULL,
  `vote_count` int DEFAULT '0',
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`option_id`, `vote_count`) VALUES
(3, 7),
(2, 4),
(5, 2),
(1, 1),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `vote_options`
--

DROP TABLE IF EXISTS `vote_options`;
CREATE TABLE IF NOT EXISTS `vote_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `option_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `vote_options`
--

INSERT INTO `vote_options` (`id`, `option_name`) VALUES
(1, 'Giới thiệu'),
(2, 'Kinh tế - Xã hội'),
(3, 'Du lịch dịch vụ'),
(4, 'Văn bản pháp luật'),
(5, 'Quốc phòng - An ninh');

-- --------------------------------------------------------

--
-- Table structure for table `welcome_message`
--

DROP TABLE IF EXISTS `welcome_message`;
CREATE TABLE IF NOT EXISTS `welcome_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `welcome_message`
--

INSERT INTO `welcome_message` (`id`, `message`) VALUES
(1, 'Chào mừng bạn đến với trang thông tin điện tử !!');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
