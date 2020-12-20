<?php
echo '<script>document.title="'.$data['data']->name_vi.' | PHIMHAY.VN";</script>';
?>

<div class="detail">
    <div class="film">
        <div class="film-col">
            <div class="card-film">
            
                <img src="<?php echo $data['data']->poster?>">
                <?php 
                    if ($data['favorite']){
                        echo '<span id="bookmark-status" class="remove-favorite" onclick="addFavorite(this)"></span>';
                    }
                    else {
                        echo '<span id="bookmark-status" class="add-favorite" onclick="addFavorite(this)"></span>';
                    }
                ?>
                <div class="nav-film">
                    <button class="btn download"><a target="_blank" href="<?php echo "/film/download/" . $data['data']->film_id ?>">Download </a></button>
                    <button class="btn trailer"><a target="_blank" href="<?php echo $data['data']->trailer?>">Trailer </a></button>
                    <button class="btn xemphim"><a href="<?php echo "/film/watch/". $data['data']->film_id?>">Xem phim </a></button>
                </div>
            </div>
        </div>
        <div class="film-col">
            <div class="card">
                <div class="card-td">
                    <a href="#"><?php echo $data['data']->name_vi?></a>
                    <p style="color: #ddd;"><?php echo $data['data']->name_en . " (" . $data['data']->year . ")"?></p>
                </div>
                <div class="card-nd">
                    <ul>
                        <li><b>Trạng thái: </b><span style="color: red;"><?php echo $data['data']->status?></span></li>
                        <li><b>Điểm IMDb: </b><span style="background-color: yellow; color: black;">
                                6.2</span> (844 votes)</li>
                        <li>
                            <b>Đạo diễn: </b>
                            <a href="#">Fernando Grostein Andrade</a></li>
                        <li>
                            <b>Quốc gia: </b>
                            <a href="#">Mỹ</a>,
                            <a href="#">Brazil</a>
                        </li>
                        <li><b>Ngày phát hành: </b>17/4/2020</li>
                        <li><b>Thời lượng: </b><?php echo $data['data']->time?> phút</li>
                        <li><b>Chất lượng: </b>Bản đẹp</li>
                        <li><b>Độ phân giải: </b>Full HD</li>
                        <li><b>Ngôn ngữ: </b>Phụ đề tiếng Việt</li>
                        <li>
                            <b>Thể loại: </b>
                            <a href="#">Phim hài hước</a>,
                            <a href="#">Phim chích kịch - Drama</a>,
                            <a href="#">Phim lẻ</a>
                        </li>
                        <li><b>Công ty SX: </b>Gullane, Spray Films</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="actors">
        <div class="actors-td">Diễn viên</div>

        <div class="actors-ds">
            <div class="actor">
                <img src="http://image.phimmoizz.net/profile/23834/medium.jpg" style="width: 100%">
                <div class="actor-tt">
                    <a href="#">Noah Schnapp</a>
                    <p>Abe</p>
                </div>
            </div>
            <div class="actor">
                <img src="http://image.phimmoizz.net/profile/23834/medium.jpg" style="width: 100%">
                <div class="actor-tt">
                    <a href="#">Noah Schnapp</a>
                    <p>Abe</p>
                </div>
            </div>
            <div class="actor">
                <img src="http://image.phimmoizz.net/profile/23834/medium.jpg" style="width: 100%">
                <div class="actor-tt">
                    <a href="#">Noah Schnapp</a>
                    <p>Abe</p>
                </div>
            </div>
            <div class="actor">
                <img src="http://image.phimmoizz.net/profile/23834/medium.jpg" style="width: 100%">
                <div class="actor-tt">
                    <a href="#">Noah Schnapp</a>
                    <p>Abe</p>
                </div>
            </div>
        </div>
    </div>

    <div class="film-detail">
        <div class="film-detail-td">NỘI DUNG PHIM
            <div class="fb-share-button" data-href="<?php echo curPageURL(); ?>" data-layout="button_count" style="float: right;">
            </div>
        </div>
        <script>
            (function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s);
                js.id = id;
                js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
        </script>
        <p><?php echo $data['data']->description?></p>
    </div>

    <div class="film-detail">
        <div class="film-detail-td">TRAILER</div>
        <div class="ytb-trailer">
            <iframe src="<?php echo "https://www.youtube.com/embed/". explode("/",$data['data']->trailer)[3]?>" width="100%" height="100%" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" frameborder="no" scrolling="no"></iframe>
        </div>
    </div>
</div>