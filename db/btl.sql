-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th12 21, 2020 lúc 09:18 AM
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
(7, '2020-12-19 02:56:12', 'test binh luan', 5, 35),
(10, '2020-12-19 13:17:33', 'day la mot binh luan', 5, 35),
(11, '2020-12-19 13:17:43', 'day la mot binh luan', 5, 35),
(12, '2020-12-19 13:17:44', 'day la mot binh luan', 5, 35),
(13, '2020-12-19 13:17:44', 'day la mot binh luan', 5, 35),
(14, '2020-12-19 13:17:44', 'day la mot binh luan', 5, 35),
(15, '2020-12-19 13:18:49', 'xin chao', 5, 35),
(16, '2020-12-19 13:44:13', 'binh luan moi', 5, 35),
(17, '2020-12-19 13:45:49', 'hihi', 5, 35),
(18, '2020-12-19 13:46:08', 'aaaaaaâ', 5, 35),
(19, '2020-12-19 16:21:31', 'new comt', 5, 31),
(20, '2020-12-20 22:02:14', 'hello', 5, 85);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dislike_film`
--

CREATE TABLE `dislike_film` (
  `user_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorite`
--

CREATE TABLE `favorite` (
  `user_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `favorite`
--

INSERT INTO `favorite` (`user_id`, `film_id`) VALUES
(5, 11),
(5, 13),
(5, 14),
(5, 15),
(5, 28),
(5, 30),
(5, 33),
(5, 50),
(5, 81),
(5, 83),
(5, 85);

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
(3, 'Quái Đản', 'Freaky', 'http://image.phimmoizz.net/film/11942/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Bộ phim có nội dung nói về một nữ sinh trung học đã hoán đổi thân xác với một tên giết người hàng loạt. Trong vòng 24 giờ, sự thay đổi này sẽ trở thành vĩnh viễn, liệu cô gái phải làm thế nào?', 102, 'https://youtu.be/9LKkfYrvr6E'),
(4, 'Phù Thủy Học Đường', 'The Craft: Legacy', 'http://image.phimmoizz.net/film/11949/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Một nhóm bạn gồm 4 người đã thực hiện nghi lễ đặc biệt để trở thành phù thủy và tiếp nhận quyền sở hữu phép thuật. Có trong tay năng lực đặc biệt, cả hội bạn dần nhận thấy có nhiều điều bí ẩn xảy ra. Dường đang có thế lực hắc ám nào đó xuất hiện và đe dọa họ.', 97, 'https://youtu.be/x5FMSuSP-qE'),
(5, 'Tenet', 'Tenet', 'http://image.phimmoizz.net/film/11048/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 4, 'Phim theo chân một tổ chức gián điệp bí ẩn có khả năng thao túng và nghịch đảo thời gian, thực thi sứ mệnh ngăn chặn Thế chiến thứ III từ trước khi nó xảy ra.', 150, 'https://youtu.be/K3tgQ_3f3HM'),
(11, 'Trốn Chạy', 'Run', 'http://image.phimmoizz.net/film/11887/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Trốn Chạy xoay quanh câu chuyện về Chloe – một cô gái xinh đẹp nhưng không may bị liệt chân và gặp khó khăn khi vận động. Diane là mẹ của Chloe và bà luôn hết mực chăm sóc con gái của mình trong từng miếng ăn, giấc ngủ. Nhưng càng lớn lên thì đứa con gái càng phát hiện ra mẹ mình có những biểu hiện lạ, bà luôn cố gắng bảo bọc đứa con của mình một cách thái quá, kiểm soát tất cả và không cho đứa trẻ giao tiếp với thế giới bên ngoài. Cái kim trong bọc lâu ngày cũng lòi ra, Chloe bắt đầu hoài nghi, và đó cũng là lúc cô tìm cách trốn chạy khỏi người mẹ “dấu yêu”.\r\n', 90, 'https://youtu.be/0Dhh7q9Us5c'),
(12, 'Mất Tích Trong Rừng Sâu', 'Missing Link', 'http://image.phimmoizz.net/film/9232/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Mr. Link - một sinh vật to lớn, lông lá nhưng vui tính và ngọt ngào - chán nản với cuộc sống cô đơn ở Tây Bắc Thái Bình Dương nên đã tuyển một nhà thám hiểm dũng cảm tên Sir Lionel Frost để dẫn dắt mình trên chuyến hành trình đi tìm bà con họ hàng thất lạc từ lâu ở thung lũng huyền thoại Shangri-La. Kết nạp thêm cô gái thích phiêu lưu Adelina Fortnight, bộ ba của chúng ta đương đầu với nhiều hiểm nguy khi du hành đến những nơi xa xôi nhất trên thế giới. Cuối cùng, cả ba nhận ra rằng đôi khi bạn lại tìm thấy gia đình mình ở những nơi mà bạn ít ngờ đến nhất', 94, 'https://youtu.be/-6jCNhebfg8'),
(13, 'BABA YAGA: ÁC QUỶ RỪNG SÂU', 'Baba Yaga: Terror of the Dark Forest', 'http://image.phimmoizz.net/film/10370/poster.medium.jpg', '/assets/movie/demo.mp4', 2019, NULL, 'Hoàn tất', 0, 0, 0, 'Baba Yaga: Ác Quỷ Rừng Sâu kể về một cặp vợ chồng trẻ đang tìm kiếm bảo mẫu để chăm sóc đứa con gái mới chào đời. Thế nhưng người được thuê về lại khiến cả đứa bé ấy và cậu con trai lớn Egor kinh sợ. Một ngày, Egor phát hiện người bảo mẫu và em gái mình biến mất một cách đầy bí ẩn.', 113, 'https://youtu.be/XLrVm8BwtgI'),
(14, 'Thảm Họa Thiên Thạch', 'Greenland', 'http://image.phimmoizz.net/film/11207/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Gia đình John Garrity và Allison, cùng con trai Nathan, tìm đường trốn chạy khỏi thảm họa thiên thạch trong vòng 48h.\r\n\r\n', 120, 'https://youtu.be/1AyxdYP1SNc'),
(15, 'Giải Cứu Cây Ước Nguyện', 'The Wishmas Tree ', 'http://image.phimmoizz.net/film/11481/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Bỏ qua lời cảnh báo của mọi người, cô chồn núi Kerry không chỉ khiến cả thành phố Thiên Đường Muôn Thú đóng băng, mà còn khiến mọi người rơi vào nguy hiểm khi hái xuống bông hoa cuối cùng của Cây Ước Nguyện. Để chuộc lại lỗi lầm và bảo vệ thành phố khỏi sự diệt vong, Kerry lên đường đi đến vùng đất Hoang Dã đầy nguy hiểm để cứu lấy Cây Ước Nguyện linh thiêng.\r\n', 90, 'https://youtu.be/78gAlE5nVLw'),
(26, 'Yêu nhau mùa ế', 'Low Season', 'http://image.phimmoizz.net/film/11161/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Yêu Nhau Mùa Ế xoay quanh Lin, cô nàng có khả năng nhìn thấy ma quỷ. Sau khi chia tay bạn trai nam thần, cô cảm thấy mệt mỏi bởi chốn thành thị xô bồ nên quyết định… lên rừng ở ẩn. Xách ba lô đến một homestay vắng vẻ ở phía Bắc, Lin vô tình gặp gỡ chàng biên kịch gia trẻ tuổi Pud. Trải qua nhiều khoảnh khắc đáng nhớ, họ dần cảm mến nhau bất chấp sự đeo bám, phá phách của các oan hồn bản địa.', 125, 'https://youtu.be/npU1H3wKLMQ'),
(27, 'Dị Nhân Thế Hệ Mới', 'The New Mutants', 'http://image.phimmoizz.net/film/7294/poster.medium.jpg', '/assets/movie/demo.mp4', 2019, NULL, 'Hoàn tất', 0, 0, 0, 'New Mutants - Dị Nhân Thế Hệ Mới là câu chuyện về năm dị nhân trẻ khám phá ra sức mạnh dị phàm của họ trong khi bị giam cầm ở một khu phức hợp. Họ phải chiến đấu để được tự do.', 98, 'https://youtu.be/w-g0V1hAHlA'),
(28, 'SPONGEBOB: BỌT BIỂN ĐÀO TẨU', 'The SpongeBob Movie: Sponge on the Run', 'http://image.phimmoizz.net/film/9881/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 4, 'SpongeBob SquarePants, chú bọt biển hài hước cùng người bạn thân nhất của anh - Patrick Star và phần còn lại của băng đảng từ thị trấn Bikini Bottom đã xuất hiện trên màn ảnh rộng trong bộ phim hoạt hình bằng CGI đầu tiên. Sau khi chú ốc sên yêu quý của SpongeBob, Gary bị bắt sên, cậu và Patrick bắt đầu một cuộc phiêu lưu hoành tráng đến The Lost City của Atlantic để đưa Gary về nhà. Hai người bạn đã cùng nhau dấn thân vào 1 hành trình nguy hiểm và đầy những tình huống oái ăm, SpongeBob và những người bạn của mình đã chứng minh rằng: Không có gì mạnh hơn sức mạnh của tình bạn. Phim dự kiến khởi chiếu tại các rạp CGV trên toàn quốc từ 12.06.2020.', 112, 'https://youtu.be/gaSidGcjw_A'),
(29, 'ĐẦU GÁU BẮC CỰC: TRUY TÌM CỔ VẬT', 'Norm of the North: King Sized Adventure', 'http://image.phimmoizz.net/film/8997/poster.medium.jpg', '/assets/movie/demo.mp4', 2019, NULL, 'Hoàn tất', 0, 0, 0, 'Đầu Gáu Bắc Cực: Truy Tìm Cổ Vật sẽ khắc họa hành trình mới của Norm và cuộc gặp gỡ định mệnh với một người bạn là con người. Trong khi Norm và những người bạn đang chuẩn bị tổ chức lễ cưới cho ông nội của cậu thì rắc rối xảy đến tại Misty Mountain. Ở đó, Norm gặp một nhà khảo cổ học tên Jin và biết rằng một cổ vật vô giá của Trung Quốc đã bị đánh cắp bởi Dexter - đối tác cũ của Jin.\r\n\r\n', 90, 'https://youtu.be/ueD-DpIe25g'),
(30, 'Khu Vườn Huyền Bí', 'The Secret Garden', 'http://image.phimmoizz.net/film/9987/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'The Secret Garden (Khu Vườn Huyền Bí) chuyển thể từ cuốn tiểu thuyết cùng tên được yêu thích của mọi thời đại, 1 trong 100 cuốn sách có giá trị nhất thế giới, Khu Vườn Huyền Bí xoay quanh cô bé Mary Lennox (Dixie Egerickx) chuyển đến nhà của người bác tại vùng nông thôn nước Anh sau khi bố mẹ qua đời. Tại đây, Mary tình cờ gặp gỡ chú chim ức đỏ và vô tình khám phá ra khu vườn bí mật đã bị đóng cửa nhiều năm trời. Cùng với người bạn Dickon, một cậu bé am hiểu về thiên nhiên và có thể nói chuyện được với các loài vật, Mary ngày ngày chăm sóc và hồi sinh khu vườn cổ tích lung linh với bao phép màu kỳ diệu.', 99, 'https://youtu.be/kSprOV4HFtk'),
(31, 'Kẻ Cuồng Sát', 'Unhinged', 'http://image.phimmoizz.net/film/11738/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Rachel (Caren Pistorius thủ vai) là một người mẹ đơn thân đang phải đối mặt với nhiều những vấn đề trong cuộc sống. Không giữ được bình tĩnh trong một buổi sáng đột nhiên bị mất việc, cô vô tình nặng lời với một người đàn ông (Russell Crowe) trên chiếc xe chắn đường mình. Rachel không hề biết rằng gã đàn ông mà cô vô tình gây hấn chính là một kẻ có vấn đề về tâm lý, điên cuồng, tàn độc và sẵn sàng “dạy dỗ” người khác bằng những bài học chết người. Cô và những người thân yêu của mình liệu có toàn mạng trong cuộc rượt đuổi đó?', 90, 'https://youtu.be/vdxDXoODKN8'),
(32, 'Phù Thủy', 'The Witches', 'http://image.phimmoizz.net/film/11716/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Phù thủy và con người luôn tồn tại song song từ xa xưa. Những phù thủy là loài sinh vật thù ghét trẻ con, chăm chăm tìm cách tiêu diệt những đứa trẻ vô tội. Bộ phim kể lại hành trình hạ gục những phù thủy xấu xa của các cô cậu bé, người mà không may bị trúng độc dược hóa chuột của phù thủy tối thượng…', 106, 'https://youtu.be/9nlhmJF5FNI'),
(33, 'Người Quen Xa Lạ', 'Intimate Strangers', 'http://image.phimmoizz.net/film/8164/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 1, 'Một nhóm bạn thân chơi với nhau đã được 30 năm. Vào đêm nọ, nhân dịp gặp mặt, bỗng một người đề nghị chơi trò chơi: Mỗi người đặt điện thoại lên bàn, bất kỳ ai nhận được tin nhắn hay cuộc gọi đều phải chia sẻ cùng nhau. Tưởng đơn giản nhưng không ngờ đây chính là trò “tự sát”. Từ đây, những góc khuất của mỗi người lần lượt bị tiết lộ.', 115, 'https://youtu.be/50PFYsf5b3s'),
(34, 'Ẩn Danh', 'Search Out', 'http://image.phimmoizz.net/film/11669/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Một cảnh sát tập sự, một người tìm việc và một hacker hợp tác cùng nhau để truy lùng ai đã gửi đi tin nhắn “Ý nghĩa cuộc đời bạn là gì?” tới một người phụ nữ, người đã tự tử ngay sau đó.', 92, 'https://youtu.be/-L3CpnuoOP0'),
(35, 'Bồng Bột Tuổi Dậy Thì', 'Love, Rosie', 'http://image.phimmoizz.net/film/1724/poster.medium.jpg', '/assets/movie/demo.mp4', 2014, NULL, 'Hoàn tất', 0, 0, 1, 'Được chuyển thể từ tiểu thuyết cùng tên của Cecelia Ahern (tác giả của P.S. I Love You). Nơi cuối cầu vồng kể về đôi bạn thân thiết Alex và Rosie từ khi bảy tuổi đã bắt đầu trao nhau những bức thư chia sẻ mọi điều buồn vui trong cuộc sống, từ chuyện con chó cưng của Alex cho tới cô Casey có cái mũi to xấu xí...', 102, 'https://youtu.be/dOMTh9Jd81w'),
(36, 'DIỆP VẤN: BẬC THẦY VÕ THUẬT', 'Ip Man: Kung Fu Master', 'http://image.phimmoizz.net/film/11979/poster.medium.jpg', '/assets/movie/demo.mp4', 2019, NULL, 'Hoàn tất', 0, 0, 6, 'IP MAN: KUNG FU MASTER quay trở lại những ngày đầu của Ip trước Cách mạng Cộng sản năm 1949. Ip, do Dennis To thể hiện lần thứ ba với vai võ sĩ nổi tiếng kèm cặp Lý Tiểu Long, lúc đó là đội trưởng cảnh sát bị buộc tội giết người của một tên cướp tàn nhẫn nhưng danh dự, và được nhắm mục tiêu báo thù bởi đứa con gái nguy hiểm của mình. Bị buộc phải từ bỏ lực lượng, Ip cũng sớm phải đối mặt với sự xuất hiện của quân đội Nhật Bản tại Quảng Châu.Trong thời gian làm đội trưởng cảnh sát ở Phật Sơn, Ip Man là mục tiêu của một băng đảng xã hội đen báo thù ngay khi quân đội Nhật Bản xâm lược khu vực\r\n\r\n', 84, 'https://youtu.be/c5qZqaVjm4Q'),
(37, 'VŨ HỘI TỐT NGHIỆP', 'The Prom', 'http://image.phimmoizz.net/film/11978/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Nhóm sao Broadway đang lúc kém vận làm đảo lộn thị trấn nhỏ ở Indiana khi họ cùng trợ giúp một cô bé tuổi teen – người chỉ muốn đến dự vũ hội cùng bạn gái.\r\n', 130, 'https://youtu.be/Zt9v3f35l5Y'),
(38, 'SÓI LANG THANG', 'WolfWalkers', 'http://image.phimmoizz.net/film/11977/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Trong một thời kỳ nơi tồn tại đầy dẫy ma thuật, khi sói bị coi là ma quỷ và ác quỷ thì cần được thuần hóa, một thợ săn học việc trẻ, Robyn, đến Ireland cùng với cha cô để quét sạch bầy sói cuối cùng. Nhưng khi Robyn cứu một cô gái bản địa hoang dã Mebh, tình bạn của họ đã đưa cô đến khám phá thế giới của những WOLFWALKERS và biến cô thành chính thứ mà cha cô có nhiệm vụ tiêu diệt.', 103, 'https://youtu.be/d_Z_tybgPgg'),
(39, 'TÂM HỒN YÊU THƯƠNG', 'The Teacher (My Soul Is Made Of Love)', 'http://image.phimmoizz.net/film/11908/poster.medium.jpg', '/assets/movie/demo.mp4', 2019, NULL, 'Hoàn tất', 0, 0, 0, 'Kevin, một giáo viên Giáo dục công dân 26 tuổi bày tỏ quan điểm ủng hộ về bình đẳng trong hôn nhân, anh ấy lập tức gây nên một làn sóng tranh cãi. Tình yêu của anh dành cho một người đàn ông mắc HIV khiến mọi người xung quanh khó chịu và rồi Kevin cũng phải đi đến một quyết định khó khăn.', 92, 'https://youtu.be/3s0LTDhqe5A'),
(40, 'BỨC THƯ CUỐI', 'Last Letter', 'http://image.phimmoizz.net/film/11973/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 8, 'Một người phụ nữ gặp lại cháu gái của mình sau nhiều năm tại đám tang em gái. Đứa cháu gái hiện đã trưởng thành. Người phụ nữ báo tin đám tang cho bạn bè của người em gái đã mất do đứa cháu gái, là con của người em gái, không thể chấp nhận cái chết của mẹ. Giữa mọi chuyện xuất hiện một bức thư từ người bạn cũ nói rằng anh ta vẫn còn tình cảm với cô, nhưng bức thư đó được gửi tới người chị gái còn sống hay người em gái đã mất?', 120, 'https://youtu.be/8bk1eqvWejs'),
(41, 'HÃY CHO TÔI TỰ DO', 'Give Me Liberty', 'http://image.phimmoizz.net/film/11952/poster.medium.jpg', '/assets/movie/demo.mp4', 2019, NULL, 'Hoàn tất', 0, 0, 0, 'Trong bộ phim hài này, tài xế vận tải y tế Vic đã mạo hiểm công việc của mình để đưa đón một nhóm cao niên ồn ào và một võ sĩ quyền anh người Nga đến đám tang. Anh kéo theo những khách hàng như Tracy, một phụ nữ trẻ mắc bệnh ALS, cùng đi.\r\n', 110, 'https://youtu.be/YR8nVCExVo4'),
(42, 'MẸ TIÊN ĐỠ ĐẦU THỜI HIỆN ĐẠI', 'Godmothered', 'http://image.phimmoizz.net/film/11974/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Một bà tiên đỡ đầu trẻ, không có kinh nghiệm đã tự mình mạo hiểm để chứng minh giá trị của mình. Cô ấy đã chứng minh bằng cách theo dõi một cô gái trẻ mà yêu cầu giúp đỡ đêm Giáng sinh năm nào bị phớt lờ.', 110, 'https://youtu.be/KYWzEqX-J-4'),
(43, 'TRÒ CHƠI CHẾT GIẪM', 'Buddy Games', 'http://image.phimmoizz.net/film/11972/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Một nhóm bạn tụ họp để chơi The Buddy Games, một loại thử thách ngáo ngơ về thể chất và tinh thần. Trong quá trình này, họ sẽ chữa lành những vết thương cũ, những sai trái trong quá khứ và tìm ra ý nghĩa thực sự của tình bạn ... hoặc cố gắng để chết', 90, 'https://youtu.be/DgOWuCeFzt4'),
(44, 'CUỒNG TÌNH', 'Ammonite', 'http://image.phimmoizz.net/film/11964/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Lấy bối cảnh năm 1840, tại vùng biển Lyme Regis, phía Nam nước Anh. Mỹ nhân Titanic vào vai nhà nghiên cứu sinh vật cổ Mary Anning (nhân vật có thật). Mary Anning từ bỏ sự nghiệp đang có để về quê chăm sóc mẹ. Tại đây, cô gặp người giúp việc Charlotte Murchison - Saoirse Ronan thủ vai. Ban đầu cả hai không hợp nhau vì khác biệt địa vị lẫn tính cách. Về sau, họ gắn kết và nảy sinh tình yêu.\r\n', 117, 'https://youtu.be/AnDhlrs3XVM'),
(45, 'TRAO GIỌNG NÓI', 'Giving Voice', 'http://image.phimmoizz.net/film/11969/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Sáu học sinh diễn viên đầy tham vọng tham gia diễn thử cho Cuộc thi Kịch độc thoại August Wilson danh giá, mà đỉnh điểm là vòng chung kết hấp dẫn trên sân khấu Broadway', 87, 'https://youtu.be/82N4-Qa-hWs'),
(46, 'ĐẢO HOA HỒNG', 'Rose Island', 'http://image.phimmoizz.net/film/11962/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Một kỹ sư giàu lý tưởng thu hút sự chú ý của thế giới – và chính phủ – khi xây dựng hòn đảo của riêng mình ngoài khơi bờ biển nước Ý và tuyên bố nó là một quốc gia.\r\n', 87, 'https://youtu.be/qS2NtbEoIc8'),
(47, 'PHI VỤ HOÀN LƯƠNG', 'Honest Thief', 'http://image.phimmoizz.net/film/11941/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Một tên cướp ngân hàng chuyên nghiệp đã giải nghệ, chấp nhận nộp mình cho FBI vì anh đã trót yêu một người phụ nữ và muốn sống cuộc sống lương thiện với cô gái đó. Liệu tên cướp này có thể ngăn chặn các đặc vụ tha hóa này lấy cắp số tiền đó và thành công \"hoàn lương\" hay không?\r\n', 99, 'https://youtu.be/0LaXlU1pgZ8'),
(48, 'MÙA HẠNH PHÚC NHẤT', 'Happiest Season', 'http://image.phimmoizz.net/film/11950/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Abby dự định sẽ cầu hôn Harper trong bữa tối gia đình, nhưng rồi cô phát hiện ra bạn gái mình vẫn chưa công khai với gia đình rằng mình là người đồng tính. Từ đó, nhiều tình huống dở khóc dở cười xảy ra, cặp đôi này phải chật vật vượt qua những xích mích, rào cản để ở bên nhau', 102, 'https://youtu.be/h58HkQV1gHY'),
(49, 'PHÙ THỦY HỌC ĐƯỜNG', 'The Craft: Legacy', 'http://image.phimmoizz.net/film/11949/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Một nhóm bạn gồm 4 người đã thực hiện nghi lễ đặc biệt để trở thành phù thủy và tiếp nhận quyền sở hữu phép thuật. Có trong tay năng lực đặc biệt, cả hội bạn dần nhận thấy có nhiều điều bí ẩn xảy ra. Dường đang có thế lực hắc ám nào đó xuất hiện và đe dọa họ.\r\n', 97, 'https://youtu.be/x5FMSuSP-qE'),
(50, 'KIẾM TÌM AGNES', 'Finding Agnes', 'http://image.phimmoizz.net/film/11948/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất', 0, 0, 0, 'Trong chuyến đi đầy cảm xúc tới Ma-rốc, một doanh nhân chắp nối cuộc đời sóng gió của người mẹ đã xa cách từ lâu và gặp cô con gái nuôi của bà', 87, 'https://youtu.be/7Gbu2ZE6tZs'),
(71, 'CHUNG CỰC BÚT KÝ', 'Ultimate Note', 'http://image.phimmoizz.net/film/11959/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Tập 18/36', 0, 0, 0, 'Vốn dĩ Ngô Tà chỉ thấy hứng thú với kinh nghiệm thực tế của chú ba, nhưng sau khi xem những cuộn băng cassette của chú mình, cậu lại phát hiện ra bản thân đã bị cuốn vào một âm mưu vô cùng lớn. Trong quá trình dấn thân vào nguy hiểm, cậu gặp được nhóm người với những mục đích khác nhau là Trương Khởi Linh, Giải Vũ Thần... Họ thành lập nhóm 6 người cùng hành động. Trương Khởi Linh bất ngờ mất trí nhớ. Mọi người tìm hiểu mới biết nhà cũ của nhà họ Trương mới là nơi có thể giải đáp mọi bí mật, nhưng do thế lực của Cầu Đức Khảo không đủ đành phải từ bỏ. Sau này, Ngô Tà nhờ tấm bản đồ mô phỏng mà quen được Hoắc Lão Thái của Cửu Môn. Không may, Ngô Tà bị thương nặng, Trương Khơi Linh và Bàn Tử sống chết không rõ, tất cả bí mật đều chưa được giải đáp. Giải Vũ Thần muốn Ngô Tà đóng giả làm chú ba, nhưng cậu lại do dự không quyết.\r\n\r\n', 45, 'https://youtu.be/A4H5tWUKJiU'),
(72, 'YÊU CHÀNG ĐIỆP VIÊN', 'The Spies Who Loved Me', 'http://image.phimmoizz.net/film/11659/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất (10/10)', 0, 0, 0, 'Jeon Ji-Hoon (Eric) đóng giả là một nhà văn du lịch, nhưng anh ta thực chất là một mật vụ cho Interpol. Công việc của anh ta giống như một mật vụ, đó là cách để Jeon Ji-Hoon hỗ trợ tài chính cho bản thân. Anh ta hiện đã ly hôn. Anh ta đã kết hôn với Kang A-Reum (Yoo In-Na), nhưng họ đã ly hôn mà Kang A-Reum không biết về cuộc đời bí mật của anh ta khi còn là một điệp viên. Kang A-Reum hiện đang là nhà thiết kế váy cưới. Cô gặp Derek Hyun (Lim Ju-Hwan) sau khi ly hôn và cuối cùng họ kết hôn với nhau.\r\n\r\nNgười chồng hiện tại của cô là một quan chức ngoại giao và có vẻ hiền lành, ấm áp. Nhưng anh ta thực chất là một điệp viên máu lạnh. Derek Hyun đối xử ngọt ngào với vợ mình, nhưng với công việc là một điệp viên , anh ta sẽ làm bất cứ điều gì. Anh yêu Kang A-Reum chân thành, nhưng anh cũng che giấu con người thật của mình với cô. Mật vụ Jeon Ji-Hoon xuất hiện trước mặt Kang A-Reum và Derek Hyun.\"\r\n\r\n', 60, 'https://youtu.be/IGaLmt-Jp3Q'),
(73, 'SỰ YÊN LẶNG CHẾT NGƯỜI', 'Hush', 'http://image.phimmoizz.net/film/11957/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Tập 3', 0, 0, 0, 'Han Joon-Hyeok là một phóng viên kỳ cựu của một tờ báo. Ban đầu, anh muốn trở thành một phóng viên để theo đuổi công lý, nhưng bây giờ anh ấy bị mâu thuẫn giữa chủ nghĩa lý tưởng và chủ nghĩa thực dụng. Han Joon-Hyeok cũng phải giải quyết các vấn đề cá nhân với tư cách là một người chồng và người cha.\r\n\r\n', 60, 'https://youtu.be/h_Oqt5Pumlc'),
(74, 'THẾ GIỚI MA QUÁI', 'Sweet Home', 'http://image.phimmoizz.net/film/11976/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất (10/10)', 0, 0, 0, 'Khi con người biến thành quái vật man rợ gieo rắc kinh hoàng, một thiếu niên trăn trở và hàng xóm ở căn hộ của cậu phải chiến đấu để sinh tồn – và giữ lấy nhân tính.\r\n', 48, 'https://youtu.be/7rI56NmD33Y'),
(75, 'STAR TREK: HÀNH TRÌNH KHÁM PHÁ (PHẦN 3)', 'Star Trek: Discovery (Season 3)', 'http://image.phimmoizz.net/film/11628/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Tập 3', 0, 0, 0, 'Star Trek: Discovery sẽ có dòng thời gian trước 10 năm so với bản phim Star Trek gốc vào năm 1966. Theo CBS, bộ phim sẽ theo hành trình của Starfleet trên đường khám phá những thế giới mới, những dạng sống mới. Trong quá trình đó, những Sĩ Quan của tàu Starfleet khám phá ra rằng để có thể hiểu được tất cả các giống loài ngoài hành inh, họ phải hiểu chính bản thân mình trước.\r\n', 50, 'https://youtu.be/iJtG20RjEQA'),
(76, 'SƠ THẦN, LÀ EM CỐ Ý LÃNG QUÊN ANH', 'Irreplaceable Love', 'http://image.phimmoizz.net/film/11888/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Hoàn tất (20/20)', 0, 0, 0, 'Nội dung phim kể về cuộc đời đầy thăng trầm của Lý Lạc Thư (Bạch Kính Đình), cùng câu chuyện tình cảm với người chị gái kết giao Sơ Dao (Tôn Di). Từ nhỏ, Lạc Thư đã là đứa trẻ mồ côi cha mẹ nên anh rất mặc cảm với bản thân, và trầm tính. Hai chị em Sơ Thần và Sơ Dao là người bạn tri kỷ duy nhất của anh, nhưng Sơ Thần mất mạng trong một trận hỏa hoạn. Trong lúc Sơ Dao đau khổ và tuyệt vọng nhất thì Lạc Thư cố gắng bên cạnh an ủi và chăm sóc cô, thay Sơ Thần làm con của nhà họ Lê, lo liệu mọi chuyện cho gia đình. Được Lạc Thư giúp đỡ, Sơ Dao dần thực hiện được ước mơ của mình. Tưởng chừng tương lại sẽ tương sáng nhưng nào ngờ sóng gió lại ập đến, Sơ Dao bị bạn trai Tử Mặc lừa, và Lạc Thư một lần nữa ra tay giúp đỡ cô.\r\n\r\n', 60, 'https://youtu.be/LQ9ezv5vAN0'),
(77, 'YÊU PHẢI NÀNG MEO TINH', 'Falling in Love With Cats', 'http://image.phimmoizz.net/film/11961/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Tập 18/24', 0, 0, 0, 'Thiếu nữ người mèo Tiểu Bạch đến trái đất tìm kiếm chàng trai đã từng cứu cô, nhưng trong vòng 365 ngày cô phải có được nụ hôn từ tình yêu đích thực loài người, nếu không sẽ tan biến. Một câu chuyện tình yêu kịch tính nhưng không kém phần lãng mạn.\r\n\r\n', 45, 'https://youtu.be/LQ9ezv5vAN0'),
(78, 'HỘI GÁI LEO NÚI', 'Hang On! Climbing Girls', 'http://image.phimmoizz.net/film/11619/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Tập 11', 0, 0, 0, 'Câu chuyện xoay quanh những nữ sinh thi đấu giải thể thao leo núi, đặc biệt là leo tường mô hình nhân tạo trong khi vẫn tận dụng hết tâm lý và cơ thể như leo núi thật sự. Một nữ sinh năm nhất, Konomi Kasahara đã phát hiện ra môn thể thao này tại trường nữ sinh Hanamiya sau khi \"rèn luyện trí não\" với những trò chơi giải đố khi còn là học sinh trung cấp. Cuộc sống của cô đã bước sang trang mới khi nhìn thấy những bức tường leo núi ở trường mới. Đây cũng là lúc mà cô đã gia nhập và yêu thích môn leo núi của trường.\r\n', 60, 'https://youtu.be/HbUqZtXPAAE'),
(79, 'CÔNG CHÚA NGỦ TRONG TÙ', 'Sleepy Princess in the Demon Castle', 'http://image.phimmoizz.net/film/11811/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Tập 10/12', 0, 0, 0, '', 23, 'https://youtu.be/k1zuZHvl9ic'),
(80, 'ÁN MẠNG TRONG ĐÊM (PHẦN 1)', 'When the Street Lights Go On (Season 1) ', 'http://image.phimmoizz.net/film/11971/poster.medium.jpg', '/assets/movie/demo.mp4', 2020, NULL, 'Tập 10/10', 0, 0, 0, 'When the streets light go on kể về một vụ giết người mà nạn nhân là một cô học sinh và một thầy giáo. Toàn bộ câu chuyện được tường thuật lại theo lời kể của Charlie. Em gái và bạn bè của nạn nhân phải vật lộn để trở lại nhịp sống bình thường và tiếp tục cuộc sống hàng ngày của họ trong khi điều tra về vụ giết người tàn khốc này.\r\n\r\n', 45, 'https://youtu.be/mahQOEbhA7o'),
(81, 'BIỆT ĐỘI SIÊU ANH HÙNG 4: HỒI KẾT', 'Avengers 4: Endgame', 'http://image.phimmoizz.net/film/7166/poster.medium.jpg', '/assets/movie/demo.mp4', 2019, NULL, 'Hoàn tất', 1, 0, 2, 'Biệt Đội Siêu Anh Hùng 4: Tàn Cuộc (Avengers 4: Endgame) ra mắt vào tháng 4/2019 sẽ giải quyết triệt để những khúc mắc đã vạch ra suốt 22 bộ phim trước đó của Vụ trụ điện ảnh Marvel (MCU). Hai tháng sau đó, Người Nhện 2 là khởi đầu hoàn toàn mới dành cho MCU.\r\n\r\nSau sự kiện Thanos làm cho một nửa vũ trụ tan biến và khiến cho biệt đội Avengers thảm bại, những siêu anh hùng sống sót phải tham gia trận chiến cuối cùng trong Avengers: Endgame.\r\n', 181, 'https://youtu.be/JsTxPRKo5Bw'),
(82, 'SÁT THỦ JOHN WICK 3: CHUẨN BỊ CHIẾN TRANH', 'John Wick: Chapter 3 - Parabellum', 'http://image.phimmoizz.net/film/8608/poster.medium.jpg', '/assets/movie/demo.mp4', 2019, NULL, 'Hoàn tất', 0, 0, 0, 'Sau khi trở thành \"giải thưởng lớn\" của giới sát thủ toàn cầu, siêu sát thủ John Wick phải cùng chú chó cưng lên đường chạy trốn. Với giá 14 triệu $, John Wick trở thành mục tiêu béo bở của bất cứ kẻ săn đầu người nào.\r\n\r\n', 131, 'https://youtu.be/rzJ2yHEbLrY'),
(83, 'GÃ HỀ', 'Joker', 'http://image.phimmoizz.net/film/8592/poster.medium.jpg', '/assets/movie/demo.mp4', 2019, NULL, 'Hoàn tất', 0, 0, 0, 'JOKER từ lâu đã là siêu ác nhân huyền thoại của điện ảnh thế giới. Nhưng có bao giờ bạn tự hỏi, Joker đến từ đâu và điều gì đã biến Joker trở thành biểu tượng tội lỗi của thành phố Gotham? JOKER sẽ là cái nhìn độc đáo về tên ác nhân khét tiếng của Vũ trụ DC – một câu chuyện gốc thấm nhuần, nhưng tách biệt rõ ràng với những truyền thuyết quen thuộc xoay quanh nhân vật mang đầy tính biểu tượng này.\r\n', 122, 'https://youtu.be/K1-11dWJocM'),
(84, 'KÝ SINH TRÙNG', 'Parasite', 'http://image.phimmoizz.net/film/8610/poster.medium.jpg', '/assets/movie/demo.mp4', 2019, NULL, 'Hoàn tất', 0, 0, 0, '“Ký Sinh Trùng” là bộ phim do đạo diễn Bong Joon-ho dàn dựng xoay quanh một gia đình nghèo. Gia đình này sống trong một căn hộ tồi tàn ở dưới tầng hầm một khu nhà cho thuê, điện thì bị cắt, chật vật chạy ăn từng bữa. Cho tới một ngày, người con trai lớn được giới thiệu làm gia sư tiếng Anh cho con gái của một gia đình giàu có. Choáng ngợp trước cơ ngơi của gia chủ, cậu bèn lên kế hoạch đưa cả gia đình mình thâm nhập vào ngôi nhà giàu có nhưng dễ tin người này, bắt đầu cuộc sống “ký sinh”.', 131, 'https://youtu.be/gzbLbA2zs_E'),
(85, 'CÂU CHUYỆN ĐỒ CHƠI 4', 'Toy Story 4 ', 'http://image.phimmoizz.net/film/8163/poster.medium.jpg', '/assets/movie/demo.mp4', 2019, NULL, 'Hoàn tất', 1, 0, 59, 'Sự trở lại rất hào hứng của dàn đồ chơi quen thuộc như Woody, Buzz Lightyear, Jessie... cùng hai nhân vật mới sẽ xuất hiện trong Toy Story4: Ducky và Bunny!', 100, 'https://youtu.be/CjpegSt3Bzc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `film_category`
--

CREATE TABLE `film_category` (
  `film_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `film_category`
--

INSERT INTO `film_category` (`film_id`, `category_id`) VALUES
(78, 18),
(79, 18),
(85, 18);

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
-- Cấu trúc bảng cho bảng `film_person`
--

CREATE TABLE `film_person` (
  `film_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `film_person`
--

INSERT INTO `film_person` (`film_id`, `person_id`) VALUES
(81, 1),
(81, 83),
(81, 84),
(81, 85),
(81, 86),
(81, 87),
(81, 88),
(81, 89),
(81, 90),
(81, 91),
(81, 92),
(81, 93);

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
(35, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 2),
(71, 3),
(72, 3),
(73, 3),
(74, 3),
(75, 3),
(76, 3),
(77, 3),
(78, 3),
(79, 3),
(80, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `like_film`
--

CREATE TABLE `like_film` (
  `user_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `like_film`
--

INSERT INTO `like_film` (`user_id`, `film_id`) VALUES
(5, 81),
(5, 85);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nation`
--

CREATE TABLE `nation` (
  `nation_id` varchar(255) NOT NULL,
  `nation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `nation`
--

INSERT INTO `nation` (`nation_id`, `nation`) VALUES
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
  `name` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `nation_id` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT 'A',
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT 'Đang cập nhật thông tin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `person`
--

INSERT INTO `person` (`person_id`, `name`, `dob`, `nation_id`, `role`, `image`, `description`) VALUES
(1, 'ROBERT DOWNEY JR.', '1965-04-04', 'US', 'A', 'http://image.phimmoizz.net/profile/17/medium.jpg', 'Robert John Downey con (Robert John Downey, Jr.)(sinh ngày 4 tháng 4 năm 1965) là một diễn viên người Mỹ. Ông sinh ra ở Thành phố New York, Hoa Kỳ. Nickname: RDJ, Bob, Rob'),
(83, 'CHRIS EVANS', '1999-12-10', 'US', 'A', 'http://image.phimmoizz.net/profile/565/medium.jpg', 'Đang cập nhật thông tin\r\n'),
(84, 'MARK RUFFALO', NULL, 'US', 'A', 'http://image.phimmoizz.net/profile/566/medium.jpg', 'Đang cập nhật thông tin'),
(85, 'CHRIS HEMSWORTH', NULL, 'AU', 'A', 'http://image.phimmoizz.net/profile/567/medium.jpg', 'Đang cập nhật thông tin'),
(86, 'SCARLETT JOHANSSON', '1984-01-22', 'US', 'A', 'http://image.phimmoizz.net/profile/63/medium.jpg', 'Scarlett Johansson sinh ra và lớn lên tại thành phố New York. Cha cô là Karsten Johansson, là kiến trúc sư người Đan Mạch gốc Thụy Điển đến từ Copenhagen, và ông nội là Ejner Johansson, biên kịch và đạo diễn. Mẹ cô là Melanie Sloan, nhà sản xuất xuất thân trong một gia đình Do Thái Ashkenazi tại the Bronx. Tổ tiên bên ngoại của cô đã di cư từ Minsk, Belarus tới New York. Cô có một chị gái là Vanessa, cũng là diễn viên; anh trai Adrian; và hai em trai song sinh Hunter (bạn diễn với cô trong Manny & Lo); và một anh trai cùng cha khác mẹ là Christian, con riêng của cha cô với người vợ trước.\r\n'),
(87, 'JEREMY RENNER', NULL, 'US', 'A', 'http://image.phimmoizz.net/profile/568/medium.jpg', 'Đang cập nhật thông tin'),
(88, 'DON CHEADLE', NULL, 'US', 'A', 'http://image.phimmoizz.net/profile/19/medium.jpg', 'Đang cập nhật thông tin\r\n'),
(89, 'PAUL RUDD', NULL, 'US', 'A', 'http://image.phimmoizz.net/profile/1508/medium.jpg', 'Đang cập nhật thông tin\r\n'),
(90, 'BENEDICT CUMBERBATCH', NULL, 'US', 'A', 'http://image.phimmoizz.net/profile/1528/medium.jpg', 'Đang cập nhật thông tin\r\n'),
(91, 'TOM HOLLAND', '1996-06-01', 'UK', 'A', 'http://image.phimmoizz.net/profile/2227/medium.jpg', 'Thomas Stanley \"Tom\" Holland là nam diễn viên, vũ công người Anh. Holland được biết đến qua vai Billy Elliot the Musical tại Nhà hát cung điện Victoria, Luân Đôn, cũng như được biết đến qua bộ phimThe Impossible năm 2012 và với vai trò Spider-Man trong Marvel Cinematic Universe. Holland được sinh ra ở Kingston upon Thames, Luân Đôn, con của bà Nicola Elizabeth (nhũ danh Frost), là một nhiếp ảnh gia, và ông Dominic Holland, là một diễn viên hài và là một người viết truyện. Anh có ba anh em, cặp song sinh Sam và Harry, kém Holland ba tuổi, sau này xuất hiện trong bộ phim Diana (2013) và Paddy, kém Holland 8 tuổi. Ông bà nội của anh được sinh ra trên đảo Isle of Man và Ireland. Holland học tại Donhead, một trường trung học cho Công giáo La Mã ở Wimbledon, Tây Nam Luân Đôn, sau đó là trường Cao đẳng Wimbledon, một trường trung học Công giáo Rôma được trợ giúp tự nguyện (cũng ở Wimbledon) cho đến tháng 12 năm 2012. Tháng 12 năm 2012, Holland đã được theo học tại Trường Nghệ thuật Biểu diễn và Công nghệ BRIT'),
(92, 'ANTHONY RUSSO', NULL, 'US', 'D', 'http://image.phimmoizz.net/profile/7297/medium.jpg', 'Đang cập nhật thông tin'),
(93, 'JOE RUSSO', NULL, 'US', 'D', 'http://image.phimmoizz.net/profile/7298/medium.jpg', 'Đang cập nhật thông tin');

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
-- Chỉ mục cho bảng `dislike_film`
--
ALTER TABLE `dislike_film`
  ADD PRIMARY KEY (`film_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`film_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

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
-- Chỉ mục cho bảng `film_person`
--
ALTER TABLE `film_person`
  ADD PRIMARY KEY (`film_id`,`person_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Chỉ mục cho bảng `film_type`
--
ALTER TABLE `film_type`
  ADD PRIMARY KEY (`film_id`,`type_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Chỉ mục cho bảng `like_film`
--
ALTER TABLE `like_film`
  ADD PRIMARY KEY (`film_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

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
  ADD KEY `naiton_id` (`nation_id`);

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
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT cho bảng `film`
--
ALTER TABLE `film`
  MODIFY `film_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT cho bảng `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
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
-- Các ràng buộc cho bảng `dislike_film`
--
ALTER TABLE `dislike_film`
  ADD CONSTRAINT `dislike_film_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dislike_film_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE CASCADE;

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
-- Các ràng buộc cho bảng `film_person`
--
ALTER TABLE `film_person`
  ADD CONSTRAINT `film_person_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `film_person_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `film_type`
--
ALTER TABLE `film_type`
  ADD CONSTRAINT `film_type_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `film_type_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `like_film`
--
ALTER TABLE `like_film`
  ADD CONSTRAINT `like_film_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `like_film_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`);

--
-- Các ràng buộc cho bảng `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`nation_id`) REFERENCES `nation` (`nation_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
