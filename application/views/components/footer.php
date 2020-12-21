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
</div>
<div id="sidebar">
    <?php
    $watchLatest = $_SESSION['watchLatest'];
    if (isset($watchLatest)) {
        echo '    <div class="right-box">
        <h2 class="right-box-title">
            <span>Đã xem gần đây</span>
        </h2>
        <div class="right-box-body">
            <ul class="list-top-movie"  style="height: auto;">';
        $list = explode("|", $watchLatest);
        foreach ($list as $film_id) {
            $sql = "SELECT * FROM film where film_id = " . $film_id;
            $result = mysqli_query($conn, $sql);

            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    echo '<li class="list-top-movie-item">
                            <a href="/film/detail/' . $row['film_id'] . '">
                                <div class="list-top-movie-item-thumb">
                                    <img src="' . $row['poster'] . '" alt="">
                                </div>
                                <div class="list-top-movie-item-info">';
                    echo '<span class="list-top-movie-item-vn">' . $row['name_vi'] . '</span>';
                    echo '<span class="list-top-movie-item-en">' . $row['name_en'] . '</span>';
                    echo '<span class="list-top-movie-item-view">Mức phổ biến: ' . $row['num_view'] . ' điểm</span>';
                    echo ' </div></a></li>';
                }
            }
        }
        echo '</ul></div></div>';
    }
    ?>

    <div class="right-box">
        <h2 class="right-box-title">
            <span>Phim lẻ hot</span>
        </h2>
        <div class="right-box-body">
            <ul class="list-top-movie">
                <?php

                $sql = "SELECT * FROM film, film_type where film.film_id = film_type.film_id and film_type.type_id = 2 order by film.num_view DESC LIMIT 8";
                $result = mysqli_query($conn, $sql);

                if (mysqli_num_rows($result) > 0) {
                    // output data of each row
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo '<li class="list-top-movie-item">
                        <a href="/film/detail/' . $row['film_id'] . '">
                            <div class="list-top-movie-item-thumb">
                                <img src="' . $row['poster'] . '">
                            </div>
                            <div class="list-top-movie-item-info">';
                        echo '<span class="list-top-movie-item-vn">' . $row['name_vi'] . '</span>';
                        echo '<span class="list-top-movie-item-en">' . $row['name_en'] . '</span>';
                        echo '<span class="list-top-movie-item-view">Mức phổ biến: ' . $row['num_view'] . ' điểm</span>';
                        echo '</div>
                        </a>
                    </li>';
                    }
                }
                ?>
            </ul>
        </div>
    </div>

    <div class="right-box">
        <h2 class="right-box-title">
            <span>Phim bộ hot</span>
        </h2>
        <div class="right-box-body">
            <ul class="list-top-movie">
                <?php

                $sql = "SELECT * FROM film, film_type where film.film_id = film_type.film_id and film_type.type_id = 3 order by film.num_view DESC LIMIT 8";
                $result = mysqli_query($conn, $sql);

                if (mysqli_num_rows($result) > 0) {
                    // output data of each row
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo '<li class="list-top-movie-item">
                        <a href="/film/detail/' . $row['film_id'] . '">
                            <div class="list-top-movie-item-thumb">
                                <img src="' . $row['poster'] . '" alt="">
                            </div>
                            <div class="list-top-movie-item-info">';
                        echo '<span class="list-top-movie-item-vn">' . $row['name_vi'] . '</span>';
                        echo '<span class="list-top-movie-item-en">' . $row['name_en'] . '</span>';
                        echo '<span class="list-top-movie-item-view">Mức phổ biến: ' . $row['num_view'] . ' điểm</span>';
                        echo '</div>
                        </a>
                    </li>';
                    }
                }
                ?>
            </ul>
        </div>
    </div>

    <div class="right-box">
        <h2 class="right-box-title">
            <span>HỒ SƠ DIỄN VIÊN</span>
        </h2>
        <div class="right-box-body">
            <ul class="list-actor">
                <?php

                $sql = 'SELECT * FROM person where role = "A" order by person_id DESC LIMIT 4';
                $result = mysqli_query($conn, $sql);

                if (mysqli_num_rows($result) > 0) {
                    // output data of each row
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo '<li class="profile-item">
                        <a href="/actor/detail/'. $row['person_id'] .'">
                        <img class="profile-image" src="'. $row['image'] .'" alt="">
                        <span class="profile-name">'. $row['name'] .' </span>
                        </a>
                        </li>';
                    }
                }

                mysqli_close($conn);
                ?>
            </ul>
        </div>
    </div>
</div>
</div>




<div class="footer">
    <div class="row">
        <div class="footer-logo-film">
            <h1>PHIMHAY.VN</h1>
        </div>
        <div class="footer-list-film">
            <div class="footer-link">
                <h3 class="footer-link-head">Phim Hay</h3><a href="javascript:void(0);" title="Phim lẻ mới">Phim lẻ
                    mới</a><a href="javascript:void(0);" title="Phim bộ mới">Phim bộ mới</a><a href="javascript:void(0);" title="Phim chiếu rạp 2013">Phim chiếu rạp</a><a href="javascript:void(0);" title="Phim kinh điển hay">Phim kinh điển</a><a href="javascript:void(0);" title="Trailer phim sắp chiếu">Phim sắp chiếu</a>
            </div>
            <div class="footer-link">
                <h3 class="footer-link-head">Phim Lẻ</h3><a href="javascript:void(0);">Phim hành động</a><a href="javascript:void(0);">Phim kiếm hiệp</a><a href="javascript:void(0);">Phim kinh
                    dị</a><a href="javascript:void(0);">Phim viễn tưởng</a><a href="javascript:void(0);">Phim hoạt hình</a>
            </div>
            <div class="footer-link">
                <h3 class="footer-link-head">Phim Bộ</h3><a href="javascript:void(0);" title="Phim bộ hàn quốc mới">Phim bộ
                    Hàn Quốc</a><a href="javascript:void(0);" title="Phim bộ Trung Quốc mới">Phim bộ Trung Quốc</a><a href="javascript:void(0);" title="Phim bộ của Mỹ mới">Phim bộ Mỹ</a><a href="javascript:void(0);" title="Phim bộ Việt Nam mới">Phim bộ Việt Nam</a><a href="javascript:void(0);" title="Phim bộ Hồng Kông mới">Phim bộ Hồng Kông</a>
            </div>
        </div>
        <div class="footer-contact">
            <span>Thông tin liên hệ:</span>
            <p>Email: contact@phimhay.vn<br>
                Phone: 0912.345.678

        </div>
    </div>
</div>
<script src="<?php echo BASEURL . "/assets/javascript/myscripts.js" ?>"></script>
</body>

</html>