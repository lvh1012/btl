<div class="register-form">
    <?php
    if (isset($_SESSION["notiLoginForm"])) {
        $msg = $_SESSION["notiLoginForm"];
        echo '<div class="noti">' . $msg . "</div>";
        unset($_SESSION["notiLoginForm"]);
    }
    ?>
    <!-- trần anh -->
    <form action=<?php echo BASEURL . "/user/login" ?> method="post">
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
            <div class="col-left"><label>Mật Khẩu</label></div>
            <div class="col-right">
                <input type="password" name="password" value="<?php if (!empty($data['password'])) : echo $data['password'];
                                                                endif; ?>">
                <p class="error"><?php if (!empty($data['passwordError'])) : echo $data['passwordError'];
                                    endif; ?></p>
            </div>
        </div>
        <div class="row-input">
            <div class="col-left"></div>
            <div class="col-right">
                <input class="btn-submit" type="submit" value="Đăng nhập">
            </div>
        </div>
    </form>
</div>