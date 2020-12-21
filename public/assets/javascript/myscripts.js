const delay = 3000; //ms

const slides = document.querySelector(".slides");
const slidesCount = slides.childElementCount;
const maxLeft = (slidesCount - 1) * 100 * -1;

let current = 0;

function changeSlide(next = true) {
  if (next) {
    current += current > maxLeft ? -100 : current * -1;
  } else {
    current = current < 0 ? current + 100 : maxLeft;
  }

  slides.style.left = current + "%";
}

let autoChange = setInterval(changeSlide, delay);
const restart = function () {
  clearInterval(autoChange);
  autoChange = setInterval(changeSlide, delay);
};

// Controls
document.querySelector(".next-slide").addEventListener("click", function () {
  changeSlide();
  restart();
});

document.querySelector(".prev-slide").addEventListener("click", function () {
  changeSlide(false);
  restart();
});

function escapeHTML(mystring){
  return mystring.replace(/&/g, "&amp;").replace(/>/g, "&gt;").replace(/</g, "&lt;").replace(/"/g, "&quot;");
}


// Hàm gọi api thêm/xóa phim yêu thích
function addFavorite(ele) {
  var className = ele.classList[0];

  if (className === 'add-favorite') {
    var film = {
      id: document.getElementById("film-id").value,
      action: 'add'
    };

    var api = new XMLHttpRequest();
    api.onreadystatechange = function () {
      if (this.readyState == 4 && this.status == 200) {
        ele.classList.remove('add-favorite');
        ele.classList.add('remove-favorite');
      }

      if (this.readyState == 4 && this.status == 401) {
        alert('Bạn phải đăng nhập để sử dụng chức năng này');
      }
    };

    api.open("POST", "/api/addFavorite", true);
    api.setRequestHeader("Content-type", "application/json");
    api.send(JSON.stringify(film));
  }
  else {
    var film = {
      id: document.getElementById("film-id").value,
      action: 'remove'
    };

    var api = new XMLHttpRequest();
    api.onreadystatechange = function () {
      // thanh cong
      if (this.readyState == 4 && this.status == 200) {
        ele.classList.remove('remove-favorite');
        ele.classList.add('add-favorite');
      }

      if (this.readyState == 4 && this.status == 401) {
        alert('Bạn phải đăng nhập để sử dụng chức năng này');
      }
    };

    api.open("POST", "/api/addFavorite", true);
    api.setRequestHeader("Content-type", "application/json");
    api.send(JSON.stringify(film));
  }
}

function sendComment() {

  if (!document.getElementById("comment").value)
    return;

  var api = new XMLHttpRequest();
  var cmt = {
    film_id: document.getElementById("film-id").value,
    comment: document.getElementById("comment").value,
  };
  api.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      var contain = document.getElementById("list-cmt");
      console.log(escapeHTML(document.getElementById("comment").value) );
      contain.innerHTML = "<div class=\"comment-content\"><div style=\"display: flex;align-items: center;\"><img class=\"avatar-content\" src=\"https://secure.gravatar.com/avatar/6a9c99ca913c3cd3c4b1264f90eb9d17?s=48&d=mm&r=g\"><label><strong style=\"color: #ffffff;\">" 
      + document.getElementById("username").value 
      + "</strong></label><span style=\"display: inline-block; color: #ddd; opacity: 0.5;font-size: 12px;\">Vừa xong</span></div><span style=\"color: #ddd;margin-left: 35px;\">" 
      + escapeHTML(document.getElementById("comment").value) 
      + "</p></div>"
      + contain.innerHTML;
      document.getElementById("comment").value = '';
    }

    if (this.readyState == 4 && this.status == 500) {
      alert('Hệ thống đang bị lỗi');
    }
  };
  api.open("POST", "/api/comment", true);
  api.setRequestHeader("Content-type", "application/json");
  api.send(JSON.stringify(cmt));
}

function like() {
  // neu button dang active thi bo like
  if (document.getElementById("like").classList.contains('active')) {
    var film = {
      id: document.getElementById("film-id").value,
      action: 'remove'
    };

    var api = new XMLHttpRequest();
    api.onreadystatechange = function () {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("like").classList.remove('active');
        var countLike = parseInt(document.getElementById("count-like").textContent);
        countLike = countLike - 1;
        document.getElementById("count-like").innerHTML = countLike;
      }

      if (this.readyState == 4 && this.status == 401) {
        alert('Bạn phải đăng nhập để sử dụng chức năng này');
      }
    };

    api.open("POST", "/api/like", true);
    api.setRequestHeader("Content-type", "application/json");
    api.send(JSON.stringify(film));
  }
  else {
    var film = {
      id: document.getElementById("film-id").value,
      action: 'add'
    };

    var api = new XMLHttpRequest();
    api.onreadystatechange = function () {
      if (this.readyState == 4 && this.status == 200) {
        if (document.getElementById("dislike").classList.contains('active')) {
          document.getElementById("dislike").classList.remove('active');
          var countDisLike = parseInt(document.getElementById("count-dislike").textContent);
          countDisLike = countDisLike - 1;
          document.getElementById("count-dislike").innerHTML = countDisLike;
        }
        document.getElementById("like").classList.add('active');
        var countLike = parseInt(document.getElementById("count-like").textContent);
        countLike = countLike + 1;
        document.getElementById("count-like").innerHTML = countLike;
      }

      if (this.readyState == 4 && this.status == 401) {
        alert('Bạn phải đăng nhập để sử dụng chức năng này');
      }
    };

    api.open("POST", "/api/like", true);
    api.setRequestHeader("Content-type", "application/json");
    api.send(JSON.stringify(film));
  }
}

// gui den api "/api/dislike"
function dislike() {
  // neu button dang active thi bo like
  if (document.getElementById("dislike").classList.contains('active')) {
    var film = {
      id: document.getElementById("film-id").value,
      action: 'remove'
    };

    var api = new XMLHttpRequest();
    api.onreadystatechange = function () {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("dislike").classList.remove('active');
        var countDisLike = parseInt(document.getElementById("count-dislike").textContent);
        countDisLike = countDisLike - 1;
        document.getElementById("count-dislike").innerHTML = countDisLike;
      }

      if (this.readyState == 4 && this.status == 401) {
        alert('Bạn phải đăng nhập để sử dụng chức năng này');
      }
    };

    api.open("POST", "/api/dislike", true);
    api.setRequestHeader("Content-type", "application/json");
    api.send(JSON.stringify(film));
  }
  else {
    var film = {
      id: document.getElementById("film-id").value,
      action: 'add'
    };

    var api = new XMLHttpRequest();
    api.onreadystatechange = function () {
      if (this.readyState == 4 && this.status == 200) {
        if (document.getElementById("like").classList.contains('active')) {
          document.getElementById("like").classList.remove('active');
          var countLike = parseInt(document.getElementById("count-like").textContent);
          countLike = countLike - 1;
          document.getElementById("count-like").innerHTML = countLike;
        }
        document.getElementById("dislike").classList.add('active');
        var countDisLike = parseInt(document.getElementById("count-dislike").textContent);
        countDisLike = countDisLike + 1;
        document.getElementById("count-dislike").innerHTML = countDisLike;
      }

      if (this.readyState == 4 && this.status == 401) {
        alert('Bạn phải đăng nhập để sử dụng chức năng này');
      }
    };

    api.open("POST", "/api/dislike", true);
    api.setRequestHeader("Content-type", "application/json");
    api.send(JSON.stringify(film));
  }
}