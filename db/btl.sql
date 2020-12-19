-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th12 19, 2020 lúc 12:06 PM
-- Phiên bản máy phục vụ: 5.7.32-0ubuntu0.18.04.1
-- Phiên bản PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `btl`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `name`) VALUES
(1, 'Hành động'),
(2, 'Chiến Tranh'),
(3, 'Viễn tưởng'),
(4, 'Hình sự'),
(5, 'Phiêu Lưu'),
(6, 'Hài hước'),
(7, 'Võ thuật'),
(8, 'Hồi hộp'),
(9, 'Kinh dị'),
(10, 'Siêu nhiên'),
(11, 'Cổ trang'),
(12, 'Thần thoại'),
(13, 'Tâm lý'),
(14, 'Tài liệu'),
(15, 'Tình cảm'),
(16, 'Âm nhạc'),
(17, 'Gia đình'),
(18, 'Hoạt hình');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`comment_id`, `time`, `content`, `user_id`, `film_id`) VALUES
(7, '2020-12-19 02:56:12', 'test binh luan', 5, 35);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorite`
--

CREATE TABLE `favorite` (
  `user_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `film`
--

CREATE TABLE `film` (
  `film_id` int(11) NOT NULL,
  `name_vi` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `release_date` date DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Hoàn tất',
  `num_like` int(11) NOT NULL DEFAULT '0',
  `num_dislike` int(11) NOT NULL DEFAULT '0',
  `num_view` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `time` int(11) NOT NULL,
  `trailer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `film`
--

INSERT INTO `film` (`film_id`, `name_vi`, `name_en`, `poster`, `resource`, `year`, `release_date`, `status`, `num_like`, `num_dislike`, `num_view`, `description`, `time`, `trailer`) VALUES
(3, 'Quái Đản', 'Freaky', 'http://image.phimmoizz.net/film/11942/poster.medium.jpg', NULL, 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Bộ phim có nội dung nói về một nữ sinh trung học đã hoán đổi thân xác với một tên giết người hàng loạt. Trong vòng 24 giờ, sự thay đổi này sẽ trở thành vĩnh viễn, liệu cô gái phải làm thế nào?', 102, 'https://youtu.be/9LKkfYrvr6E'),
(4, 'Phù Thủy Học Đường', 'The Craft: Legacy', 'http://image.phimmoizz.net/film/11949/poster.medium.jpg', NULL, 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Một nhóm bạn gồm 4 người đã thực hiện nghi lễ đặc biệt để trở thành phù thủy và tiếp nhận quyền sở hữu phép thuật. Có trong tay năng lực đặc biệt, cả hội bạn dần nhận thấy có nhiều điều bí ẩn xảy ra. Dường đang có thế lực hắc ám nào đó xuất hiện và đe dọa họ.', 97, 'https://youtu.be/x5FMSuSP-qE'),
(5, 'Tenet', 'Tenet', 'http://image.phimmoizz.net/film/11048/poster.medium.jpg', NULL, 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Phim theo chân một tổ chức gián điệp bí ẩn có khả năng thao túng và nghịch đảo thời gian, thực thi sứ mệnh ngăn chặn Thế chiến thứ III từ trước khi nó xảy ra.', 150, 'https://youtu.be/K3tgQ_3f3HM'),
(11, 'Trốn Chạy', 'Run', 'http://image.phimmoizz.net/film/11887/poster.medium.jpg', NULL, 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Trốn Chạy xoay quanh câu chuyện về Chloe – một cô gái xinh đẹp nhưng không may bị liệt chân và gặp khó khăn khi vận động. Diane là mẹ của Chloe và bà luôn hết mực chăm sóc con gái của mình trong từng miếng ăn, giấc ngủ. Nhưng càng lớn lên thì đứa con gái càng phát hiện ra mẹ mình có những biểu hiện lạ, bà luôn cố gắng bảo bọc đứa con của mình một cách thái quá, kiểm soát tất cả và không cho đứa trẻ giao tiếp với thế giới bên ngoài. Cái kim trong bọc lâu ngày cũng lòi ra, Chloe bắt đầu hoài nghi, và đó cũng là lúc cô tìm cách trốn chạy khỏi người mẹ “dấu yêu”.\r\n', 90, 'https://youtu.be/0Dhh7q9Us5c'),
(12, 'Mất Tích Trong Rừng Sâu', 'Missing Link', 'http://image.phimmoizz.net/film/9232/poster.medium.jpg', NULL, 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Mr. Link - một sinh vật to lớn, lông lá nhưng vui tính và ngọt ngào - chán nản với cuộc sống cô đơn ở Tây Bắc Thái Bình Dương nên đã tuyển một nhà thám hiểm dũng cảm tên Sir Lionel Frost để dẫn dắt mình trên chuyến hành trình đi tìm bà con họ hàng thất lạc từ lâu ở thung lũng huyền thoại Shangri-La. Kết nạp thêm cô gái thích phiêu lưu Adelina Fortnight, bộ ba của chúng ta đương đầu với nhiều hiểm nguy khi du hành đến những nơi xa xôi nhất trên thế giới. Cuối cùng, cả ba nhận ra rằng đôi khi bạn lại tìm thấy gia đình mình ở những nơi mà bạn ít ngờ đến nhất', 94, 'https://youtu.be/-6jCNhebfg8'),
(13, 'BABA YAGA: ÁC QUỶ RỪNG SÂU', 'Baba Yaga: Terror of the Dark Forest', 'http://image.phimmoizz.net/film/10370/poster.medium.jpg', NULL, 2019, NULL, 'Hoàn tất', 0, 0, 0, 'Baba Yaga: Ác Quỷ Rừng Sâu kể về một cặp vợ chồng trẻ đang tìm kiếm bảo mẫu để chăm sóc đứa con gái mới chào đời. Thế nhưng người được thuê về lại khiến cả đứa bé ấy và cậu con trai lớn Egor kinh sợ. Một ngày, Egor phát hiện người bảo mẫu và em gái mình biến mất một cách đầy bí ẩn.', 113, 'https://youtu.be/XLrVm8BwtgI'),
(14, 'Thảm Họa Thiên Thạch', 'Greenland', 'http://image.phimmoizz.net/film/11207/poster.medium.jpg', NULL, 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Gia đình John Garrity và Allison, cùng con trai Nathan, tìm đường trốn chạy khỏi thảm họa thiên thạch trong vòng 48h.\r\n\r\n', 120, 'https://youtu.be/1AyxdYP1SNc'),
(15, 'Giải Cứu Cây Ước Nguyện', 'The Wishmas Tree ', 'http://image.phimmoizz.net/film/11481/poster.medium.jpg', NULL, 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Bỏ qua lời cảnh báo của mọi người, cô chồn núi Kerry không chỉ khiến cả thành phố Thiên Đường Muôn Thú đóng băng, mà còn khiến mọi người rơi vào nguy hiểm khi hái xuống bông hoa cuối cùng của Cây Ước Nguyện. Để chuộc lại lỗi lầm và bảo vệ thành phố khỏi sự diệt vong, Kerry lên đường đi đến vùng đất Hoang Dã đầy nguy hiểm để cứu lấy Cây Ước Nguyện linh thiêng.\r\n', 90, 'https://youtu.be/78gAlE5nVLw'),
(26, 'Yêu nhau mùa ế', 'Low Season', 'http://image.phimmoizz.net/film/11161/poster.medium.jpg', NULL, 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Yêu Nhau Mùa Ế xoay quanh Lin, cô nàng có khả năng nhìn thấy ma quỷ. Sau khi chia tay bạn trai nam thần, cô cảm thấy mệt mỏi bởi chốn thành thị xô bồ nên quyết định… lên rừng ở ẩn. Xách ba lô đến một homestay vắng vẻ ở phía Bắc, Lin vô tình gặp gỡ chàng biên kịch gia trẻ tuổi Pud. Trải qua nhiều khoảnh khắc đáng nhớ, họ dần cảm mến nhau bất chấp sự đeo bám, phá phách của các oan hồn bản địa.', 125, 'https://youtu.be/npU1H3wKLMQ'),
(27, 'Dị Nhân Thế Hệ Mới', 'The New Mutants', 'http://image.phimmoizz.net/film/7294/poster.medium.jpg', NULL, 2019, NULL, 'Hoàn tất', 0, 0, 0, 'New Mutants - Dị Nhân Thế Hệ Mới là câu chuyện về năm dị nhân trẻ khám phá ra sức mạnh dị phàm của họ trong khi bị giam cầm ở một khu phức hợp. Họ phải chiến đấu để được tự do.', 98, 'https://youtu.be/w-g0V1hAHlA'),
(28, 'SPONGEBOB: BỌT BIỂN ĐÀO TẨU', 'The SpongeBob Movie: Sponge on the Run', 'http://image.phimmoizz.net/film/9881/poster.medium.jpg', NULL, 2020, NULL, 'Hoàn tất', 0, 0, 0, 'SpongeBob SquarePants, chú bọt biển hài hước cùng người bạn thân nhất của anh - Patrick Star và phần còn lại của băng đảng từ thị trấn Bikini Bottom đã xuất hiện trên màn ảnh rộng trong bộ phim hoạt hình bằng CGI đầu tiên. Sau khi chú ốc sên yêu quý của SpongeBob, Gary bị bắt sên, cậu và Patrick bắt đầu một cuộc phiêu lưu hoành tráng đến The Lost City của Atlantic để đưa Gary về nhà. Hai người bạn đã cùng nhau dấn thân vào 1 hành trình nguy hiểm và đầy những tình huống oái ăm, SpongeBob và những người bạn của mình đã chứng minh rằng: Không có gì mạnh hơn sức mạnh của tình bạn. Phim dự kiến khởi chiếu tại các rạp CGV trên toàn quốc từ 12.06.2020.', 112, 'https://youtu.be/gaSidGcjw_A'),
(29, 'ĐẦU GÁU BẮC CỰC: TRUY TÌM CỔ VẬT', 'Norm of the North: King Sized Adventure', 'http://image.phimmoizz.net/film/8997/poster.medium.jpg', NULL, 2019, NULL, 'Hoàn tất', 0, 0, 0, 'Đầu Gáu Bắc Cực: Truy Tìm Cổ Vật sẽ khắc họa hành trình mới của Norm và cuộc gặp gỡ định mệnh với một người bạn là con người. Trong khi Norm và những người bạn đang chuẩn bị tổ chức lễ cưới cho ông nội của cậu thì rắc rối xảy đến tại Misty Mountain. Ở đó, Norm gặp một nhà khảo cổ học tên Jin và biết rằng một cổ vật vô giá của Trung Quốc đã bị đánh cắp bởi Dexter - đối tác cũ của Jin.\r\n\r\n', 90, 'https://youtu.be/ueD-DpIe25g'),
(30, 'Khu Vườn Huyền Bí', 'The Secret Garden', 'http://image.phimmoizz.net/film/9987/poster.medium.jpg', NULL, 2020, NULL, 'Hoàn tất', 0, 0, 0, 'The Secret Garden (Khu Vườn Huyền Bí) chuyển thể từ cuốn tiểu thuyết cùng tên được yêu thích của mọi thời đại, 1 trong 100 cuốn sách có giá trị nhất thế giới, Khu Vườn Huyền Bí xoay quanh cô bé Mary Lennox (Dixie Egerickx) chuyển đến nhà của người bác tại vùng nông thôn nước Anh sau khi bố mẹ qua đời. Tại đây, Mary tình cờ gặp gỡ chú chim ức đỏ và vô tình khám phá ra khu vườn bí mật đã bị đóng cửa nhiều năm trời. Cùng với người bạn Dickon, một cậu bé am hiểu về thiên nhiên và có thể nói chuyện được với các loài vật, Mary ngày ngày chăm sóc và hồi sinh khu vườn cổ tích lung linh với bao phép màu kỳ diệu.', 99, 'https://youtu.be/kSprOV4HFtk'),
(31, 'Kẻ Cuồng Sát', 'Unhinged', 'http://image.phimmoizz.net/film/11738/poster.medium.jpg', NULL, 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Rachel (Caren Pistorius thủ vai) là một người mẹ đơn thân đang phải đối mặt với nhiều những vấn đề trong cuộc sống. Không giữ được bình tĩnh trong một buổi sáng đột nhiên bị mất việc, cô vô tình nặng lời với một người đàn ông (Russell Crowe) trên chiếc xe chắn đường mình. Rachel không hề biết rằng gã đàn ông mà cô vô tình gây hấn chính là một kẻ có vấn đề về tâm lý, điên cuồng, tàn độc và sẵn sàng “dạy dỗ” người khác bằng những bài học chết người. Cô và những người thân yêu của mình liệu có toàn mạng trong cuộc rượt đuổi đó?', 90, 'https://youtu.be/vdxDXoODKN8'),
(32, 'Phù Thủy', 'The Witches', 'http://image.phimmoizz.net/film/11716/poster.medium.jpg', NULL, 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Phù thủy và con người luôn tồn tại song song từ xa xưa. Những phù thủy là loài sinh vật thù ghét trẻ con, chăm chăm tìm cách tiêu diệt những đứa trẻ vô tội. Bộ phim kể lại hành trình hạ gục những phù thủy xấu xa của các cô cậu bé, người mà không may bị trúng độc dược hóa chuột của phù thủy tối thượng…', 106, 'https://youtu.be/9nlhmJF5FNI'),
(33, 'Người Quen Xa Lạ', 'Intimate Strangers', 'http://image.phimmoizz.net/film/8164/poster.medium.jpg', NULL, 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Một nhóm bạn thân chơi với nhau đã được 30 năm. Vào đêm nọ, nhân dịp gặp mặt, bỗng một người đề nghị chơi trò chơi: Mỗi người đặt điện thoại lên bàn, bất kỳ ai nhận được tin nhắn hay cuộc gọi đều phải chia sẻ cùng nhau. Tưởng đơn giản nhưng không ngờ đây chính là trò “tự sát”. Từ đây, những góc khuất của mỗi người lần lượt bị tiết lộ.', 115, 'https://youtu.be/50PFYsf5b3s'),
(34, 'Ẩn Danh', 'Search Out', 'http://image.phimmoizz.net/film/11669/poster.medium.jpg', NULL, 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Một cảnh sát tập sự, một người tìm việc và một hacker hợp tác cùng nhau để truy lùng ai đã gửi đi tin nhắn “Ý nghĩa cuộc đời bạn là gì?” tới một người phụ nữ, người đã tự tử ngay sau đó.', 92, 'https://youtu.be/-L3CpnuoOP0'),
(35, 'Bồng Bột Tuổi Dậy Thì', 'Love, Rosie', 'http://image.phimmoizz.net/film/1724/poster.medium.jpg', NULL, 2014, NULL, 'Hoàn tất', 0, 0, 0, 'Được chuyển thể từ tiểu thuyết cùng tên của Cecelia Ahern (tác giả của P.S. I Love You). Nơi cuối cầu vồng kể về đôi bạn thân thiết Alex và Rosie từ khi bảy tuổi đã bắt đầu trao nhau những bức thư chia sẻ mọi điều buồn vui trong cuộc sống, từ chuyện con chó cưng của Alex cho tới cô Casey có cái mũi to xấu xí...', 102, 'https://youtu.be/dOMTh9Jd81w');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `film_category`
--

CREATE TABLE `film_category` (
  `film_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `film_nation`
--

CREATE TABLE `film_nation` (
  `film_id` int(11) NOT NULL,
  `nation_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `film_type`
--

CREATE TABLE `film_type` (
  `film_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `film_type`
--

INSERT INTO `film_type` (`film_id`, `type_id`) VALUES
(3, 1),
(4, 1),
(5, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nation`
--

CREATE TABLE `nation` (
  `nation_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `nation`
--

INSERT INTO `nation` (`nation_id`, `name`) VALUES
('AU', 'Úc'),
('CA', 'Canada'),
('CN', 'Trung Quốc'),
('FR', 'Pháp'),
('HK', 'Hồng Kông'),
('IN', 'Ấn Độ'),
('JP', 'Nhật Bản'),
('KR', 'Hàn Quốc'),
('OT', 'Quốc gia khác'),
('TH', 'Thái Lan'),
('TW', 'Đài Loan'),
('UK', 'Anh'),
('US', 'Mỹ'),
('VN', 'Việt Nam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `person`
--

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `dob` date NOT NULL,
  `naiton_id` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `type`
--

INSERT INTO `type` (`type_id`, `name`) VALUES
(1, 'Phim chiếu rạp'),
(2, 'Phim lẻ'),
(3, 'Phim bộ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(1) DEFAULT 'U'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `gender`, `password`, `role`) VALUES
(5, 'Admin', 'admin@gmail.com', 'm', '$2y$10$ReNiI6P.LRXgAr1w36XN.ONaJfnSlBR3Xx6AnmD1YrKpAuXV9s9Wq', 'A'),
(6, 'Lê Viết Hoàng', 'lehoang99.18xt@gmail.com', 'm', '$2y$10$Ldivj7yvFl4VtlUB8.FanOglejv8m1PbTMlDHPgiag91mbnAZZoMu', 'U');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `watch_later`
--

CREATE TABLE `watch_later` (
  `user_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `film_id` (`film_id`);

--
-- Chỉ mục cho bảng `favorite`
--
ALTER TABLE `favorite`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `film_id` (`film_id`);

--
-- Chỉ mục cho bảng `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`film_id`);

--
-- Chỉ mục cho bảng `film_category`
--
ALTER TABLE `film_category`
  ADD PRIMARY KEY (`film_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `film_nation`
--
ALTER TABLE `film_nation`
  ADD PRIMARY KEY (`film_id`,`nation_id`),
  ADD KEY `nation_id` (`nation_id`);

--
-- Chỉ mục cho bảng `film_type`
--
ALTER TABLE `film_type`
  ADD PRIMARY KEY (`film_id`,`type_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Chỉ mục cho bảng `nation`
--
ALTER TABLE `nation`
  ADD PRIMARY KEY (`nation_id`);

--
-- Chỉ mục cho bảng `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`),
  ADD KEY `naiton_id` (`naiton_id`);

--
-- Chỉ mục cho bảng `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `watch_later`
--
ALTER TABLE `watch_later`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `film_id` (`film_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT cho bảng `film`
--
ALTER TABLE `film`
  MODIFY `film_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT cho bảng `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `film_category`
--
ALTER TABLE `film_category`
  ADD CONSTRAINT `film_category_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `film_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `film_nation`
--
ALTER TABLE `film_nation`
  ADD CONSTRAINT `film_nation_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `film_nation_ibfk_2` FOREIGN KEY (`nation_id`) REFERENCES `nation` (`nation_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `film_type`
--
ALTER TABLE `film_type`
  ADD CONSTRAINT `film_type_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `film_type_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`naiton_id`) REFERENCES `nation` (`nation_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `watch_later`
--
ALTER TABLE `watch_later`
  ADD CONSTRAINT `watch_later_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `watch_later_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
