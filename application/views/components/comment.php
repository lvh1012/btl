<div class="comment">
    <div class="widget-area no-padding blank">
        <div class="status-upload">
            <div style="display: flex;align-items: center;">
                <img class="avatar" src="https://secure.gravatar.com/avatar/6a9c99ca913c3cd3c4b1264f90eb9d17?s=48&d=mm&r=g" alt="">
                <?php
                if (isset($_SESSION['userId'])) {
                    echo '<textarea id = "comment" placeholder="Bạn đang nghĩ gì?"></textarea>';
                }
                else{
                    echo '<textarea id = "comment" placeholder="Bạn phải đăng nhập mới có thể bình luận" readonly disabled></textarea>';
                }
                ?>

                
            </div>
            <div class="box-comment-bottom">
                
            <?php
                if (isset($_SESSION['userId'])) {
                    echo '<button type="submit" class="button-submit-comment" onclick="sendComment()">Bình luận</button>';
                }
                else{
                    echo '<button type="submit" class="button-submit-comment" disabled>Bình luận</button>';
                }
                ?>
            </div>
            <input id="film-id" type="number" hidden value="<?php echo $data->film_id ?>"/>
        </div>
        <hr>
        <div class="comment-content">
            <div style="display: flex;align-items: center;">
                <img class="avatar-content" src="https://secure.gravatar.com/avatar/6a9c99ca913c3cd3c4b1264f90eb9d17?s=48&d=mm&r=g" alt="">
                <label><strong style="color: #ffffff;"><?php echo $_SESSION['username'] ?></strong></label>
            </div>
            <span style="color: #ffffff;margin-left: 35px;opacity: 0.5;">Phim hay quás</p>
        </div>
    </div>
</div>