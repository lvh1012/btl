<div class="register-form">
    <!-- trần anh -->
    <form action=<?php echo BASEURL . "/user/register" ?> method="post">
        <div class="row-input">
            <div class="col-left"><label>Họ Tên</label></div>
            <div class="col-right">
                <input type="text" name="fullname" value="<?php if(!empty($data['fullname'])): echo $data['fullname']; endif; ?>">
                <p class="error"><?php if(!empty($data['fullnameError'])): echo $data['fullnameError']; endif; ?></p>
            </div>
        </div>
        <div class="row-input">
            <div class="col-left"><label>Email</label></div>
            <div class="col-right">
                <input type="text" name="email" value="<?php if(!empty($data['email'])): echo $data['email']; endif; ?>">
                <p class="error"><?php if(!empty($data['emailError'])): echo $data['emailError']; endif; ?></p>
            </div>
        </div>
        <div class="row-input">
            <div class="col-left"><label>Mật Khẩu</label></div>
            <div class="col-right">
                <input type="password" name="password" value="<?php if(!empty($data['password'])): echo $data['password']; endif; ?>">
                <p class="error"><?php if(!empty($data['passwordError'])): echo $data['passwordError']; endif; ?></p>
            </div>
        </div>
        <div class="row-input">
            <div class="col-left"><label>Giới Tính</label></div>
            <div class="col-right">
                <label><input type="radio" name="gender" value="m" <?php if(!empty($data['gender']) && $data['gender']=="m"): echo "checked"; endif; ?>> Nam</label>
                <label><input type="radio" name="gender" value="f" <?php if(!empty($data['gender']) && $data['gender']=="f"): echo "checked"; endif; ?>> Nữ</label>
                <p class="error"><?php if(!empty($data['genderError'])): echo $data['genderError']; endif; ?></p>
            </div>
        </div>
        <div class="row-input">
            <div class="col-left"></div>
            <div class="col-right">
                <input class="btn-submit" type="submit" value="Đăng ký">
            </div>
        </div>
    </form>
</div>