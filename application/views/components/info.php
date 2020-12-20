<?php
echo '<script>document.title="' . $data['info']->name . ' | PHIMHAY.VN";</script>';
?>
<div class="detail">
    <div class="film">
        <div class="film-col">
            <div class="card-film">

                <img src="<?php echo  $data['info']->image ?>">
            </div>
        </div>
        <div class="film-col">
            <div class="card">
                <div class="card-td" style="margin: 5px 0;">
                    <a href="#"><?php echo  $data['info']->name ?></a>
                </div>
                <div class="card-nd">
                    <ul>
                        <li><b>Tên: </b><?php echo  $data['info']->name ?></li>
                        <li><b>Ngày sinh: </b><?php echo  $data['info']->dob ?></li>
                        <li><b>Quốc gia: </b><?php echo  $data['info']->nation ?></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="film-detail">
        <div class="film-detail-td">Tiểu sử
        </div>
        <p><?php echo  $data['info']->description ?></p>
    </div>
</div>