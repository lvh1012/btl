<div class="register-form">
    <?php
    if (isset($_SESSION["notiLoginForm"])) {
        $msg = $_SESSION["notiLoginForm"];
        echo '<div class="noti">' . $msg . "</div>";
        unset($_SESSION["notiLoginForm"]);
    }
    ?>
    <!-- trần anh -->
    <form action=<?php echo BASEURL . "/user/request" ?> method="post">
        <div class="row-input">
            <div class="col-left"><label>Email</label></div>
            <div class="col-right">
                <input type="text" name="email" value="<?php if (!empty($data['email'])) : echo $data['email'];
                                                        endif; ?>">
                <p class="error"><?php if (!empty($data['emailError'])) : echo $data['emailError'];
                                    endif; ?></p>
            </div>
        </div>
        <div class="row-input">
            <div class="col-left"><label>Tên phim</label></div>
            <div class="col-right">
                <input type="text" name="name" value="<?php if (!empty($data['name'])) : echo $data['name'];
                                                        endif; ?>">
                <p class="error"><?php if (!empty($data['nameError'])) : echo $data['nameError'];
                                    endif; ?></p>
            </div>
        </div>

        <div class="row-input">
            <div class="col-left"><label>Trailer</label></div>
            <div class="col-right">
                <input type="text" name="trailer" value="<?php if (!empty($data['trailer'])) : echo $data['trailer'];
                                                        endif; ?>">
                <p class="error"><?php if (!empty($data['trailerError'])) : echo $data['trailerError'];
                                    endif; ?></p>
            </div>
        </div>

        <div class="row-input">
            <div class="col-left"></div>
            <div class="col-right">
                <input class="btn-submit" type="submit" value="Gửi yêu cầu">
            </div>
        </div>
    </form>
</div>