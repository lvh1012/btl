<?php
// Create connection
$conn = mysqli_connect(HOST, USER, PASSWORD, DATABASE);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
} else {
    $conn->set_charset("utf8");
}
?>


<!DOCTYPE html>
<html>

<head>
    <title>Page Title</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<?php echo BASEURL . "/assets/css/mystyle.css" ?>">
    <link rel="shortcut icon" href="<?php echo BASEURL . "/assets/images/favicon.ico" ?>" type="image/x-icon" />
</head>

<body>
    <div class="header">
        <div class="row">
            <div class="header-logo">
                <a class="logo" href="<?php echo BASEURL ?>">
                    <h1>PHIMHAY.VN</h1>
                </a>
            </div>
            <div class="search">
                <form method="GET" id="form-search" action="tim-kiem/">
                    <div>
                        <input id="search-input" type="text" name="keyword" placeholder="Tên phim" value="">
                        <input id="search-submit" class="" value=" " type="submit"></div>
                </form>
            </div>
            <div class="user-header">
                <?php
                if (isset($_SESSION['userId'])) {
                    echo '<a href="/user/favorite" type="button" class="btn-red btn-small">Tủ phim</a>';
                    echo '<a href="/user/logout" type="button" class="btn-black btn-small">Đăng xuất</a>';
                } else {
                    echo '<a class="button-register" href="/user/register"></a>';
                    echo '<a class="button-login" href="/user/login" ></a>';
                    echo '<a class="button-login-with-fb" href="javascript:void(0);"></a>';
                }
                
                ?>
            </div>
        </div>
    </div>

    <div class="nav">
        <div class="row">
            <ul class="menu">
                <li>
                    <a href="<?php echo BASEURL ?>">phim hay</a>
                </li>
                <li class="category">
                    <a href="javascript:void(0);">thể loại</a>
                    <div class="sub-menu list-category">
                        <ul class="sub">
                            <?php

                            $sql = "SELECT name FROM category";
                            $result = mysqli_query($conn, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                // output data of each row
                                while ($row = mysqli_fetch_assoc($result)) {
                                    echo "<li><a> Phim " . strtolower($row['name']) . "</a></li>";
                                }
                            }

                            // mysqli_close($conn);
                            ?>
                        </ul>
                    </div>
                </li>
                <li class="nation">
                    <a href="javascript:void(0);">quốc gia</a>
                    <div class="sub-menu list-nation">
                        <ul class="sub">
                            <?php

                            $sql = "SELECT name FROM nation";
                            $result = mysqli_query($conn, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                // output data of each row
                                while ($row = mysqli_fetch_assoc($result)) {
                                    echo "<li><a> " . $row['name'] . "</a></li>";
                                }
                            }

                            mysqli_close($conn);
                            ?>
                        </ul>
                    </div>
                </li>
                <li class="movie">
                    <a href="javascript:void(0);">phim lẻ</a>
                    <div class="sub-menu list-movie">
                        <ul class="sub">
                            <?php
                            $year = array(2020, 2019, 2018, 2017,2016, 2015, 2014, "khác");
                            foreach ($year as &$value) {
                                echo "<li><a> Năm " . $value . "</a></li>";;
                            }
                            ?>
                        </ul>
                    </div>
                </li>
                <li class="seri">
                    <a href="javascript:void(0);">phim bộ</a>
                    <div class="sub-menu list-seri">
                        <ul class="sub">
                            <li>
                                <a> Phim bộ Hàn Quốc </a>
                            </li>
                            <li>
                                <a> Phim bộ Trung Quốc </a>
                            </li>
                            <li>
                                <a> Phim bộ Thái Lan </a>
                            </li>
                            <li>
                                <a> Phim bộ Đài Loan </a>
                            </li>
                            <li>
                                <a> Phim bộ Hồng Kông </a>
                            </li>
                            <li>
                                <a> Phim bộ Mỹ </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="javascript:void(0);">phim chiếu rạp</a>
                </li>
                <li>
                    <a href="javascript:void(0);">Trailer</a>
                </li>
                <li>
                    <a href="javascript:void(0);">top imdb 2020</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="container">
        <div id="hot-movie">
            <h2 class="block-title">
                <span class="title">
                    Phim đề cử
                </span>
            </h2>
            <div class="carousel">
                <!-- trần huy -->
                <div class="slides">
                    <div class="slide">
                        <a href="https://www.youtube.com/watch?v=0R8IbpKXavM&ab_channel=MINOFFICIAL" title="Ten film">
                            <img class="image-slide" src="http://pic0.iqiyipic.com/common/lego/20201212/a4efc9c74bcd46b89cd4862372d4c772.webp" alt="slide image">
                        </a>
                    </div>

                    <div class="slide">
                        <a href="https://www.youtube.com/watch?v=EWz4fITO5qg&ab_channel=MINOFFICIAL" title="Ten film">
                            <img class="image-slide" src="http://pic2.iqiyipic.com/common/lego/20201003/6933dfb56ba649139a47d52e51a00279.webp" alt="slide image">
                        </a>
                    </div>
                    <div class="slide">
                        <a href="https://www.youtube.com/watch?v=UBv-GcD3jHE&ab_channel=Kha" title="Ten film">
                            <img class="image-slide" src="http://pic2.iqiyipic.com/common/lego/20201212/1342e90791c44e1b96b517cebaf5382c.webp" alt="slide image">
                        </a>
                    </div>
                </div>

                <div class="controls">
                    <div class="control prev-slide">&#9668;</div>
                    <div class="control next-slide">&#9658;</div>
                </div>
            </div>
        </div>
        <div id="content">