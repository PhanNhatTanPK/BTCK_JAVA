-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2022 at 09:23 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `billdetail`
--

CREATE TABLE `billdetail` (
  `id` bigint(20) NOT NULL,
  `id_product` bigint(20) NOT NULL,
  `quanty` int(11) NOT NULL,
  `total` double NOT NULL,
  `id_bills` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) NOT NULL,
  `quanty` int(100) NOT NULL,
  `username` varchar(150) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `note` longtext NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `quanty`, `username`, `phone`, `display_name`, `address`, `note`, `total`) VALUES
(2, 1, 'tan@gmail.com', '123', 'Phan Tan', 'Quy NhÃÂ¡n', 'null', 58990000);

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categorys`
--

INSERT INTO `categorys` (`id`, `name`, `description`) VALUES
(1, 'MacBook', NULL),
(2, 'ASUS', NULL),
(3, 'Dell', NULL),
(4, 'Lenovo', NULL),
(5, 'Acer', NULL),
(6, 'HP', NULL),
(7, 'MSI', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `id_product` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `id_product`, `name`, `code`, `img`) VALUES
(1, 1, 'Xám', '#808080', 'macbook-air-m1.jpg'),
(2, 2, 'Xám', '#808080', 'macbook-pro-m2.jpg'),
(3, 3, 'Đen', '#000000', 'AsusTuf.jpg'),
(4, 4, 'Đen', '#808080', 'AsusRog.jpg'),
(5, 5, 'Đen', '#000000', 'AcerAspire.jpg'),
(6, 6, 'Đen', '#000000', 'AcerNitro5.jpg'),
(7, 7, 'Xanh Đen', '#16145F', 'hp-gaming-victus.jpg'),
(8, 8, 'Xám', '#808080', 'HP240G8.jpg'),
(9, 9, 'Xám', '#808080', 'HpPavilion.jpg'),
(10, 10, 'Xám', '#808080', 'dell-gaming-g15.jpg'),
(11, 11, 'Đen', '#000000', 'DellVostro.jpg'),
(12, 12, 'Xanh Đen', '#16145F', 'LenovoGamingLegion5.jpg'),
(13, 13, 'Xám', '#808080', 'LenovoThinkbook.jpg'),
(14, 14, 'Đen', '#000000', 'msi-gaming-gf63.jpg'),
(15, 15, 'Xám', '#808080', 'msiGamingGe66.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `url`) VALUES
(1, 'Home', NULL),
(2, 'Product', NULL),
(3, 'Cart', NULL),
(4, 'Post', NULL),
(5, 'Contact', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `id_category` int(11) NOT NULL,
  `ram` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `sale` int(3) NOT NULL,
  `title` varchar(255) NOT NULL,
  `highlight` tinyint(1) NOT NULL,
  `new_product` tinyint(1) NOT NULL,
  `details` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `id_category`, `ram`, `name`, `price`, `sale`, `title`, `highlight`, `new_product`, `details`, `created_at`, `updated_at`) VALUES
(1, 1, '8GB', 'MacBook Air M1', 39990000, 0, 'Laptop Apple MacBook Air M1 2020 16GB/512GB/8-core GPU', 1, 0, 'Apple MacBook Air M1 2020 với vẻ ngoài hiện đại cùng cấu hình mạnh mẽ vượt trội đến từ con chip M1 được sản xuất trên quy trình tân tiến, là người bạn đồng hành lý tưởng cho bất kỳ ai trong cả những công việc văn phòng hay thiết kế đồ họa.\r\nBước tiến mới nhờ bộ vi xử lý mạnh mẽ vượt trội\r\nCon chip M1 được thiết kế CPU 8 lõi và Neural Engine 16 lõi mang đến tốc độ hiệu năng nhanh hơn gấp 3.5 lần, đem đến khả năng vận hành mạnh mẽ trong mọi tác vụ với Word, Excel hay thỏa sức sáng tạo với các phần mềm thiết kế, cho hiệu quả công việc cao hơn, đáp ứng tốt hầu hết mọi yêu cầu từ người dùng.\r\n\r\nĐồng thời, card đồ họa tích hợp 8 nhân GPU mang đến hiệu suất đồ họa vượt bậc, cho hình ảnh chuẩn xác trong cả những công việc cơ bản hay nâng cao, cùng bạn giải quyết mọi thiết kế phức tạp bằng các ứng dụng Photoshop, Ai, Pr... một cách mượt mà, trơn tru, đạt hiệu quả cao trong công việc.', '2022-06-16 13:50:21', '2022-06-16 13:50:21'),
(2, 1, '8GB', 'MacBook Pro M2', 41990000, 0, 'Laptop MacBook Pro M2 2022 8GB/512GB/10-core GPU (MNEJ3SA/A)', 1, 1, 'Không chỉ đẳng cấp ở phong cách thiết kế, chiếc MacBook Pro M2 2022 còn thống trị về sức mạnh hiệu năng với sự xuất hiện của con chip Apple M2, hứa hẹn sẽ đồng hành trọn vẹn trên mọi trải nghiệm của bạn từ học tập, làm việc, giải trí cho đến thiết kế đồ họa chuyên sâu.\r\nVận hành tác vụ chuyên nghiệp hơn với con chip M2 mạnh mẽ \r\nChip Apple M2 được xem là điểm nhấn sáng giá cho laptop Apple Macbook ở năm 2022 với hiệu suất hoạt động cao hơn 18% và băng thông nhiều hơn 50% so với dòng chip M1, tăng năng suất làm việc của người dùng lên đáng kể ở mọi tác vụ. Tiến trình 5 nm với 20 nghìn tỷ bóng bán dẫn cho khả năng giải quyết công việc ấn tượng nhưng vẫn tiết kiệm được nguồn điện năng đáng kinh ngạc.\r\n\r\nMacBook Pro một lần nữa đã khẳng định vị thế của một chiếc laptop đồ họa - kỹ thuật mạnh mẽ với card tích hợp 10 nhân GPU, cho hiệu suất hoạt động cao hơn 25% so với dòng chip M1 khi cả hai đang ở mức điện năng tương đương. Các công việc liên quan đến hình ảnh, thiết kế, render,... trên các phần mềm đồ họa đều được Apple giải quyết nhẹ nhàng với khả năng xử lý lên đến 15.8 nghìn tỷ tác vụ trong 1 giây.', '2022-06-16 13:50:21', '2022-06-16 13:50:21'),
(3, 2, '8GB', 'Asus TUF Gaming', 21490000, 0, 'Laptop Asus TUF Gaming FX506HC i5 11400H/8GB/512GB/4GB RTX3050/144Hz/Win11 (HN144W)', 1, 1, 'Laptop Asus TUF Gaming FX506HC i5 (HN144W) với cấu hình mạnh mẽ, thiết kế độc đáo cùng khả năng chiến tốt các tựa game hiện hành là sự lựa chọn phù hợp cho bạn. \r\nLaptop Asus mang trong mình CPU Intel Core i5 11400H mạnh mẽ cùng card rời RTX 3050 4 GB đảm bảo trải nghiệm chơi game của bạn hay thiết kế đồ hoạ chuyên sâu được mượt mà nhất.\r\n\r\nLaptop Asus TUF gaming sở hữu RAM 8 GB cho khả năng đa nhiệm ổn định, khuyến khích nâng cấp để có trải nghiệm tốt nhất. SSD 512 GB tăng tốc độ truy xuất dữ liệu, khởi động ứng dụng, laptop nhanh chóng.\r\n\r\nChiếc máy được trang bị màn hình 15.6 inch chân thật, tần số quét 144 Hz kết hợp công nghệ Adaptive Sync giúp hạn chế tình trạng giật xé màn hình. \r\n\r\nThiết kế nổi bật của dòng laptop gaming với logo cánh TUF in đậm trên nền màu đen cùng hoạ tiết xước phây sang trọng.', '2022-06-16 13:54:00', '2022-06-16 13:54:00'),
(4, 2, '8GB', 'Asus Rog Zephyrus Gaming', 25990000, 0, 'Laptop Asus Rog Zephyrus Gaming G14 GA401QH R7 5800HS/8GB/512GB/4GB GTX1650/120Hz/Túi/Win11 (K2091W)', 1, 0, 'Bạn cần tìm laptop gaming có thiết kế độc đáo, mỏng nhẹ với cấu hình mạnh mẽ vượt trội, laptop Asus Rog Zephyrus Gaming G14 GA401QH (K2091W) là sự lựa chọn hoàn hảo với trang bị chip AMD hiệu năng ấn tượng cùng card màn hình rời NVIDIA GTX sẵn sàng giải quyết mọi tác vụ thiết kế đồ hoạ trơn tru và chiến game cực phấn khích.\r\n• Laptop Asus được trang bị CPU AMD Ryzen 7 5800HS cho hiệu năng vượt trội kết hợp với card rời NVIDIA GTX 1650 4 GB đột phá đáp ứng mọi nhu cầu chiến game mượt mà, thiết kế đồ hoạ chuyên sâu như Photoshop, Premiere, After Effect,...\r\n\r\n• RAM 8 GB cho khả năng đa nhiệm các tác vụ mượt mà, hạn chế tình trạng giật lag. SSD 512 GB cho không gian lưu trữ đủ dùng, tốc độ truy xuất dữ liệu nhanh chóng.\r\n\r\n• Màn hình laptop Asus Rog 14 inch có tần số quét 120 Hz, độ phân giải WQXGA (2560 x 1600) kết hợp độ sáng 300 nits cho chất lượng hiển thị sắc nét. Tấm nền IPS cho góc nhìn rộng lên đến 178 độ. Ngoài ra, màn hình còn được tích hợp công nghệ 100% DCI-P3 cho màu sắc chuẩn xác, sống động. Công nghệ Anti Glare chống chói, bảo vệ thị giác người dùng sau thời gian dài sử dụng.', '2022-06-16 13:54:00', '2022-06-16 13:54:00'),
(5, 5, '8GB', 'Acer Aspire A514', 17990000, 0, 'Laptop Acer Aspire A514 54 511G i5 1135G7/8GB/1TB SSD/Win11 (NX.A28SV.009)', 1, 1, 'Một sự lựa chọn mới mẻ nằm trong phân khúc tầm trung dành cho mọi đối tượng đặc biệt là học sinh, sinh viên hay dân văn phòng chính là chiếc laptop Acer Aspire A514 54 511G i5 (NX.A28SV.009) với hiệu năng mạnh mẽ đến từ con chip Intel thế hệ 11 cùng ổ cứng SSD lên đến 1 TB. \r\nỔn định mọi tác vụ văn phòng với con chip Intel Gen 11 mạnh mẽ \r\nChiếc laptop Acer này được trang bị con chip Intel Core i5 Tiger Lake 1135G7 cùng card tích hợp Intel Iris Xe Graphics mang đến hiệu năng làm việc trên các ứng dụng học tập, văn phòng của Office mượt mà cũng như giúp bạn chỉnh sửa hình ảnh, thiết kế đồ họa hay chơi các tựa game giải trí đình đám như LOL ở mức ổn định. Mình đã thử test con game quốc dân Liên Minh Huyền Thoại trên chiếc máy này và cảm thấy các kỹ năng của con tướng cũng như quá trình tốc biến, biến về,... trong game chỉ nằm ở mức tạm chấp nhận được, nên nếu bạn chỉ chơi game để giải trí vui vẻ thì vẫn ổn nha.', '2022-06-16 13:56:38', '2022-06-16 13:56:38'),
(6, 5, '8GB', 'Acer Nitro 5 Gaming', 28040000, 0, 'Laptop Acer Nitro 5 Gaming AN515 57 5831 i5 11400H/8GB/512GB/6GB RTX3060/144Hz/Win10 (NH.QDGSV.003)', 0, 1, 'Laptop Acer Nitro 5 Gaming AN515 57 5831 i5 (NH.QDGSV.003) là thế hệ laptop gaming mới của nhà Acer có nhiều thay đổi trong thiết kế. Hiệu năng vẫn giữ vững phong độ, tự tin mang đến cho game thủ trải nghiệm chơi game cực đã. \r\nThiết kế mạnh mẽ chuẩn gaming \r\nChiếc laptop này mang đến cảm giác cực hầm hố thể hiện sự mạnh mẽ trên từng đường nét với gam màu đen tuyền, các góc cạnh cứng cáp. Vỏ máy được làm từ nhựa cao cấp đem đến khả năng chịu lực tốt, máy có độ dày khoảng 23.9 mm và trọng lượng 2.2 kg, không quá nặng khi cho vào balo để di chuyển đối với một chiếc máy tính gaming 15.6 inch. Mặt lưng của phiên bản mới này được tô điểm thêm bằng những đường cắt góc cạnh tựa như những tia sét trên nền đen nhám, tạo cảm giác khí thế mỗi khi mở nắp máy.', '2022-06-16 13:56:38', '2022-06-16 13:56:38'),
(7, 6, '8GB', 'HP Gaming VICTUS', 28990000, 0, 'Laptop HP Gaming VICTUS 16 d0202TX i5 11400H/8GB/32GB+512GB/4GB RTX3050Ti/144Hz/Win11 (4R0U4PA)', 1, 1, 'Laptop HP Gaming VICTUS 16 d0202TX i5 11400H (4R0U4PA) là phiên bản laptop gaming đầy mới mẻ với thiết kế thời thượng cùng cấu hình ổn định, sẵn sàng cùng bạn chinh phục mọi tác vụ công việc, giải trí.\r\nCPU Intel Core i5 Tiger Lake 11400H và card đồ họa rời NVIDIA GeForce RTX3050Ti, 4 GB trên laptop HP VICTUS cho khả năng xử lý công việc văn phòng, thiết kế hình ảnh nhanh chóng, chiến mượt mà các tựa game có mức đồ họa trung bình.\r\n\r\nRAM 8 GB đa nhiệm mượt mà mọi tác vụ, ổ cứng SSD 512 GB NVMe PCle mang đến không gian lưu trữ đủ dùng, truy xuất dữ liệu nhanh chóng.\r\n\r\nMàn hình 16.1 inch, công nghệ Anti Glare, tấm nền IPS và độ sáng màn hình 250 nits, mang đến hình ảnh sắc nét, chân thật với khung hình rộng mở.\r\n\r\nLaptop màn hình 144 Hz cho những pha hành động diễn ra mượt mà, trơn tru.\r\n\r\nLaptop HP có trọng lượng 2.46 kg và độ dày 23.5 mm sẵn sàng đồng hành cùng bạn trong mọi không gian.\r\n\r\nĐèn nền đơn sắc được trang bị ở bàn phím hỗ trợ gõ tốt ở những nơi ánh sáng yếu.\r\n\r\nĐa dạng các cổng giao tiếp trên laptop như 3 cổng SuperSpeed USB A, HDMI, LAN (RJ45), USB Type-C và khe cắm SD.\r\n\r\nCông nghệ Bang & Olufsen Audio kết hợp cùng HP Audio Boost mang đến âm thanh to rõ, sống động.', '2022-06-16 13:58:51', '2022-06-16 13:58:51'),
(8, 6, '8GB', 'HP 240 G8', 16990000, 0, 'Laptop HP 240 G8 i5 1135G7/8GB/512GB/Win10 (518V7PA)', 0, 1, 'Với thiết kế hiện đại, bền bỉ cùng hiệu năng vượt trội đến từ con chip Intel Gen 11 tân tiến, laptop HP 240 G8 i5 (518V7PA) tự tin đáp ứng tốt các nhu cầu học tập, làm việc và giải trí cơ bản hàng ngày của bạn.\r\nVẻ ngoài tối giản không kém phần sang trọng\r\nChiếc laptop HP cơ bản G8 này được chế tác từ nhựa cao cấp, mang vẻ ngoài tối giản, hiện đại, phủ tông màu bạc sang trọng, thích hợp với đa dạng người dùng ở độ tuổi khác nhau.\r\n\r\nMáy có trọng lượng nhẹ 1.426 kg và độ dày 19.9 mm, thuận lợi bỏ vừa vặn vào balo, túi xách, tự tin luôn sẵn sàng đồng hành cùng bạn đi học tập, làm việc ở trường lớp, văn phòng công ty, quán cà phê,... ', '2022-06-16 13:58:51', '2022-06-16 13:58:51'),
(9, 6, '8GB', 'HP Pavilion 15', 16690000, 0, 'Laptop HP Pavilion 15 eg0507TU i5 1135G7/8GB/256GB/Win11 (46M06PA)', 1, 0, 'Laptop HP Pavilion 15 eg0507TU i5 1135G7 (46M06PA) sở hữu thiết kế thanh lịch cùng gam màu vàng đồng phù hợp cho mọi đối tượng, với cấu hình ổn định là sự chọn lựa phù hợp cho bất kỳ ai.\r\nBộ vi xử lý Intel Core i5 Tiger Lake 1135G7 cùng card đồ họa tích hợp Intel Iris Xe Graphics được trang bị ở chiếc laptop HP Pavilion này vừa giúp bạn xử lý tốt các tác vụ văn phòng, chỉnh sửa ảnh, thiết kế sản phẩm đơn giản, render video cơ bản,...\r\n\r\nChiếc laptop học tập - văn phòng này đáp ứng tốt mọi nhu cầu nhờ RAM 8 GB và ổ cứng SSD 256 GB NVMe PCle, giúp bạn có không gian vừa đủ, thoải mái mở cùng lúc nhiều ứng dụng, không lo giật lag.\r\n\r\nLaptop HP còn sở hữu trọng lượng 1.682 kg và độ dày 17.9 mm, với nắp lưng và chiếu nghỉ tay được chế tác từ kim loại cao cấp, sẵn sàng đồng hành cùng bạn đến bất kỳ đâu.\r\n\r\nDọc hai bên laptop là một số cổng kết nối phổ biến như: 2 cổng USB 3.1, HDMI, USB Type-C và khe cắm Micro SD hỗ trợ bạn tốt hơn trong quá trình truyền xuất dữ liệu.\r\n\r\nLaptop màn hình 15.6 inch viền mỏng cùng công nghệ Wled-backlit, công nghệ Anti Glare và tấm nền IPS cho bạn tận hưởng không gian hình ảnh rộng mở đến 178 độ, mà không lo mỏi mắt, lóa mắt.\r\n\r\nCông nghệ Bang & Olufsen Audio cung cấp âm thanh to rõ, với khả năng khử tiếng ồn tốt, cho bạn những trải nghiệm với âm nhạc hay phim ảnh thật khó quên.', '2022-06-16 14:01:07', '2022-06-16 14:01:07'),
(10, 3, '8GB', 'Dell Gaming G15', 29999000, 0, 'Laptop Dell Gaming G15 5511 i7 11800H/8GB/512GB/4GB RTX3050/120Hz/Office H&S/Win11 (P105F006AGR)', 1, 1, 'Laptop Dell Gaming G15 5511 i7 11800H (P105F006AGR) là phiên bản laptop có diện mạo ấn tượng thu hút mọi ánh nhìn cùng cấu hình vượt trội sẵn sàng đồng hành cùng bạn trong mọi công việc cho đến giải trí. \r\nSở hữu CPU Intel Core i7 Tiger Lake 11800H cùng card rời NVIDIA GeForce RTX 3050 4 GB mang lại hiệu năng vượt trội xử lý nhanh chóng mọi tác vụ từ văn phòng đến đồ hoạ, kỹ thuật hay chiến những tựa game hấp dẫn như GTA V, Fifa Online 4,...\r\n\r\nBộ nhớ RAM 8 GB đa nhiệm mượt mà cùng lúc nhiều tác vụ. Ổ cứng SSD 512 GB rút ngắn thời gian phản hồi, khởi động máy, cung cấp không gian lưu trữ đủ dùng.\r\n\r\nMàn hình viền mỏng 15.6 inch trên laptop Dell được trang bị tần số quét 120 Hz cho trải nghiệm hình ảnh khi lướt web, chiến game được mượt mà hơn. Công nghệ WVA mang đến góc nhìn rộng cùng công nghệ Anti Glare hạn chế tình trạng loá, mờ khi sử dụng ở nơi có ánh sáng mạnh.\r\n\r\nLaptop Dell Gaming mang thiết kế vô cùng ấn tượng với những đường cắt gọt cá tính, lớp vỏ nhựa màu đen cứng cáp. Trọng lượng 2.81 kg cho cảm giác rất chắc chắn khi cầm nắm hay di chuyển.\r\n\r\nChiếc laptop đồ họa - kỹ thuật này được cài đặt sẵn hệ điều hành Windows 11 Home SL cùng bộ Office Home & Student 2021 vĩnh viễn hỗ trợ tối ưu mọi nhu cầu sử dụng của người dùng mà không phải nâng cấp.\r\n\r\nTrang bị nhiều cổng kết nối tiện lợi như 3 x USB 3.2, HDMI, LAN (RJ45) cùng USB Type-C (Power Delivery and DisplayPort). Đèn bàn phím đơn sắc cũng được tích hợp giúp gõ chính xác trong điều kiện thiếu sáng.\r\n\r\nCông nghệ Nahimic Audio giúp giả lập hệ thống âm vòm 3D sống động, cung cấp âm thanh chất lượng cao cùng với kỹ thuật lọc và khử tiếng ồn hiệu quả mang lại trải nghiệm sống động, đắm chìm.', '2022-06-16 14:01:07', '2022-06-16 14:01:07'),
(11, 3, '8GB', 'Dell Vostro', 22590000, 0, 'Laptop Dell Vostro 5410 i5 11320H/8GB/512GB/Office H&S/Win11 (V4I5214W1)', 0, 1, 'Sở hữu phong cách thiết kế thanh lịch, tinh tế cùng những thông số kỹ thuật khá ấn tượng cho đa dạng nhu cầu từ laptop học tập - văn phòng đến giải trí cơ bản, laptop Dell Vostro 5410 i5 (V4I5214W1) sẽ là một lựa chọn mang lại sự hài lòng cho bạn.\r\nMượt mà đa tác vụ với con chip Intel Gen 11 ấn tượng\r\nVận hành mượt mà mọi tác vụ từ cơ bản đến nâng cao nhờ sở hữu cấu trúc 4 nhân 8 luồng mạnh mẽ được trang bị trên bộ vi xử lý Intel Core i5 Tiger Lake 11320H, đạt tốc độ văn phòng cơ bản 3.20 GHz giải quyết nhẹ nhàng các công việc trên Word, Excel, PowerPoint,... và ép xung lên đến 4.5 GHz cho các nhu cầu giải trí đa dạng hơn từ lướt web, xem phim, nghe nhạc,... đến các phần mềm thiết kế đồ họa. \r\n\r\nHiệu suất đồ họa được cải thiện tương đối vượt trội với chất lượng hình ảnh rõ nét hơn, kết xuất lên đến 8K cho các tác phẩm nghệ thuật hoàn hảo nhờ card tích hợp Intel Iris Xe Graphics, các thao tác chỉnh sửa hình ảnh, biên tập video cơ bản trên những phần mềm đồ họa Photoshop, Illustrator, Figma,... trở nên chuyên nghiệp hơn hay lôi cuốn bạn vào những con game hấp dẫn có mức cài đặt 1080p 60 FPS. \r\n\r\nĐa nhiệm ấn tượng hơn bao giờ hết khi cho phép bạn mở cùng lúc nhiều cửa sổ trình duyệt hay các ứng dụng khác nhau để phục vụ tối đa nhu cầu làm việc, nâng cao năng suất cũng như chất lượng của người dùng nhờ bộ nhớ RAM 8 GB chuẩn DDR4 2 khe (1 khe 8 GB + 1 khe rời) có tốc độ Bus RAM lên đến 3200 MHz, song song đó còn cung cấp khả năng nâng cấp RAM 32 GB cho phép bạn tải thêm nhiều tài liệu bổ ích mà không lo nặng máy.', '2022-06-16 14:03:30', '2022-06-16 14:03:30'),
(12, 4, '8GB', 'Lenovo Gaming Legion 5', 35990000, 0, 'Laptop Lenovo Gaming Legion 5 15ITH6 i7 11800H/16GB/512GB/4GB RTX3050Ti/165Hz/Win11 (82JK00FNVN)', 1, 1, 'Phong cách thiết kế độc đáo, trẻ trung cùng hiệu năng mạnh mẽ vượt trội của card màn hình NVIDIA RTX hội tụ trong chiếc laptop Lenovo Gaming Legion 5 15ITH6 i7 (82JK00FNVN) hứa hẹn sẽ cân mọi tựa game đình đám cũng như sẵn sàng hỗ trợ bạn xử lý các tác vụ nặng.\r\nHiệu năng mạnh mẽ vượt trội cân mọi tác vụ \r\nĐầu tiên là đến với con game bắn súng quốc dân Battlefield 1, máy vận hành mượt mà với trung bình 75 FPS. Ở đây chúng ta sẽ thấy CPU Intel Core i7 11800H hiệu năng cao chỉ phải hoạt động tầm 42% công suất, card màn hình NVIDIA RTX 3050Ti cũng chỉ hơi mạnh hơn CPU một xíu với 69% công suất.', '2022-06-16 14:03:30', '2022-06-16 14:03:30'),
(13, 4, '8GB', 'Lenovo ThinkBook', 24290000, 0, 'Laptop Lenovo ThinkBook 14s G2 ITL i7 1165G7/8GB/512GB/Win11 (20VA003RVN)', 0, 1, 'Mang đến cấu hình mạnh mẽ, sẵn sàng đánh bại mọi đối thủ khó nhằn nhưng laptop Lenovo ThinkBook 14s G2 ITL i7 1165G7 (20VA003RVN) vẫn sở hữu ngoại hình tao nhã với sắc xám thời thượng, là người cộng sự lý tưởng cho mọi cuộc hành trình.\r\nSức mạnh đáng kinh ngạc đến từ chip Intel Gen 11\r\nDễ dàng xử lý mọi tác vụ văn phòng đơn giản với Word, Excel,... nhờ bộ vi xử lý Intel Core i7 Tiger Lake 1165G7 với cấu trúc 4 nhân 8 luồng sở hữu tốc độ xung nhịp cơ bản đạt 2.80 GHz và tối đa lên đến 4.7 GHz Turbo Boost, mang đến hiệu suất tối ưu hơn trong mọi việc, cả trong xử lý đồ họa phức tạp hay những trận game đầy kịch tính.\r\n\r\nThỏa mãn khả năng sáng tạo của bạn khi cho phép người dùng thoải mái sử dụng các ứng dụng Photoshop, Premiere, AI, Figma,... một cách mượt mà với hình ảnh chuẩn xác nhờ card đồ họa tích hợp Intel Iris Xe Graphics, cho những khung hình 8K sắc nét, không những thế còn hỗ trợ CPU đạt hiệu suất cao hơn, mang đến hiệu quả công việc tốt hơn.\r\n\r\nHỗ trợ người dùng mở cùng lúc nhiều ứng dụng và chuyển đổi qua lại mà không lo xảy ra tình trạng giật lag máy nhờ RAM 8 GB chuẩn DDR4 (On board) tốc độ Bus RAM 4266 MHz, cho phép bạn có thể vừa nghe nhạc vừa thiết kế một các mượt mà.', '2022-06-16 14:05:56', '2022-06-16 14:05:56'),
(14, 7, '8GB', 'MSI Gaming GF63', 25990000, 0, 'Laptop MSI Gaming GF63 Thin 11UD i7 11800H/8GB/512GB/4GB RTX3050Ti Max-Q/Balo/Chuột/Win11 (648VN)', 1, 1, 'Sở hữu một vẻ ngoài độc đáo, mạnh mẽ phù hợp với mọi game thủ, chiếc laptop MSI Gaming GF63 Thin 11UD i7 11800H (648VN) được trang bị dòng chip Intel thế hệ 11 hiệu năng mạnh mẽ vượt trội khi đi cùng card màn hình rời RTX 3050 Ti Max-Q sẵn sàng chiến mượt bất kì tựa game phổ biến hay thiết kế đồ họa chuyên sâu.\r\nSở hữu CPU Intel Core i7 11800H kết hợp cùng card màn hình NVIDIA RTX 3050Ti Max-Q 4 GB mang lại trải nghiệm giải trí cực đã với các tựa game đình đám như GTA V, CS:GO, FIFA,... Bên cạnh đó khả năng xử lý đồ họa chuyên sâu cũng sẽ là lợi thế của dòng card RTX này.\r\n\r\nLaptop MSI được trang bị bộ nhớ SSD 512 GB kết hợp RAM 8 GB cho khả năng lưu trữ dữ liệu đủ dùng, tốc độ truy xuất dữ liệu, ghi chép dữ liệu cũng như khởi động máy nhanh chóng.\r\n\r\nChiếc laptop MSI GF được trang bị màn hình 15.6 inch có độ phủ màu 100% sRGB kết hợp tấm nền IPS mang lại chất lượng hình ảnh sắc nét, sống động cùng góc nhìn rộng lên đến 178 độ. Tính năng được tích hợp đi kèm là chống chói Anti-Glare giúp bảo vệ mắt của bạn sau một thời gian dài sử dụng.\r\n\r\nDiện mạo đậm chất laptop gaming được hoàn thiện từ lớp vỏ kim loại bền bỉ, trọng lượng chỉ 1.86 kg và dày 21.7 mm dễ dàng đồng hành cùng bạn trong mọi không gian chiến game.\r\n\r\nĐa dạng cổng kết nối giúp bạn dễ dàng kết nối với các thiết bị ngoại vi mọi lúc như: 3 x Type-A USB 3.2 Gen 1, HDMI, LAN (RJ45), USB Type-C.\r\n\r\nCông nghệ Realtek High Definition Audio trên laptop cung cấp chất lượng âm thanh ổn định, ngoài ra còn có tính năng khuếch đại khi xem phim, nghe nhạc, giải trí, tăng sự phấn khích khi chiến game.', '2022-06-16 14:05:56', '2022-06-16 14:05:56'),
(15, 7, '8GB', 'MSI Gaming GE66 Raider', 58990000, 0, 'Laptop MSI Gaming GE66 Raider 11UG i7 11800H/16GB/2TB SSD/8GB RTX3070/360Hz/Balo/Chuột/Win10 (258VN) ', 1, 1, 'Vươn lên tầm cao mới cùng laptop MSI Gaming GE66 Raider 11UG i7 11800H (258VN) với thiết kế độc lạ, đem đến vô vàn tính năng cao, chinh phục mọi công việc khó nhằn hay chiến đấu cực đỉnh trên mọi chiến trường game. \r\nBức phá sức mạnh nhờ chip Intel Gen 11 Core i7\r\nPhát huy tối đa hiệu suất trong công việc nhờ bộ vi xử lý Intel Core i7 Tiger Lake 11800H với 8 nhân 16 luồng, đạt tốc độ CPU 2.30 GHz và tối đa lên đến 4.6 GHz nhờ Turbo Boost, thỏa mãn bạn trong việc xử lý gọn nhẹ các tác vụ công việc từ văn phòng đến đồ hoạ nâng cao, chỉnh sửa hình ảnh phức tạp, kết xuất 3D,... không gì có thể cản trở hay chinh chiến đầy mạnh mẽ trong mọi trận chiến game.\r\n\r\nNâng cấp trải nghiệm lên một tầm cao mới nhờ laptop RAM 16 GB chuẩn DDR4 2 khe (1 khe 8 GB + 1 khe 8 GB) với tốc độ Bus RAM 3200 MHz, đem lại sự đa nhiệm ấn tượng, cho phép người dùng mở nhiều tab hay ứng dụng và chuyển đổi qua lại mà không lo giật hay lag máy. Bên cạnh đó, hỗ trợ nâng cấp RAM tối đa 64 GB, đáp ứng tối đa nhu cầu của người dùng.', '2022-06-16 14:08:01', '2022-06-16 14:08:01');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `img`, `caption`, `content`) VALUES
(1, 'MacBookAirM1.jpg', 'MacBook Air M1', 'Có thiết kế đẹp, sang trọng với CPU M1 độc quyền từ Apple cho hiệu năng đồ họa cao'),
(2, 'DellG15R5.jpg', 'Dell Gaming G15', 'Bộ hiệu năng gây ấn tượng đến từ con chip AMD mạnh mẽ cùng thiết kế cá tính, nổi bật'),
(3, 'MSIGamingGF63.jpg', 'MSI Gaming GF63 Thin', 'Sở hữu một vẻ ngoài độc đáo, mạnh mẽ phù hợp với mọi game thủ'),
(4, 'HPGamingVICTUS.jpg', 'HP Gaming VICTUS 16', 'Phiên bản laptop gaming đầy mới mẻ với thiết kế thời thượng cùng cấu hình ổn định, sẵn sàng cùng bạn chinh phục mọi tác vụ công việc, giải trí.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `display_name`, `address`) VALUES
(2, 'tan@gmail.com', '$2a$06$XxsmD3ltT8oUknaYSTPB7e7wgb1zTCcWXmBQVPrY/QWCC/Ynxs0le', 'Phan Tan', 'Quy NhÆ¡n'),
(3, 'tan@gmail.com', '$2a$06$VT//H56k4.ghGvKenB.rDexUmMi8jk4wAogFH8.pKzY3mmL7vhIlW', 'Phan Tan', 'Quy NhÆ¡n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_product_2` (`id_product`),
  ADD KEY `id_bills` (`id_bills`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_product_2` (`id_product`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_category_2` (`id_category`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billdetail`
--
ALTER TABLE `billdetail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billdetail`
--
ALTER TABLE `billdetail`
  ADD CONSTRAINT `billdetail_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `billdetail_ibfk_2` FOREIGN KEY (`id_bills`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `colors`
--
ALTER TABLE `colors`
  ADD CONSTRAINT `colors_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categorys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
