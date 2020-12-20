<?php
echo '<script>document.title="'.$data['data']->name_vi.' | PHIMHAY.VN";</script>';
?>

<div class="detail">
    <div class="film">
        <div class="film-col">
            <div class="card-film">
            
                <img src="http://image.phimmoizz.net/profile/20465/medium.jpg">
            </div>
        </div>
        <div class="film-col">
            <div class="card">
                <div class="card-td"  style="margin: 5px 0;">
                    <a href="#">YUKI KAJI</a>
                </div>
                <div class="card-nd">
                    <ul>
                        <li><b>Tên: </b>N/A</li>
                        <li><b>Ngày sinh: </b>N/A</li>
                        <li><b>Quốc gia: </b>N/A</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="film-detail">
        <div class="film-detail-td">Tiểu sử
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
        <p>Đang cập nhật thông tin</p>
    </div>
</div>