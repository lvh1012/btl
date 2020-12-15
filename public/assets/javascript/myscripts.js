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


// Hàm gọi api thêm/xóa phim yêu thích
function addFavorite(ele) {
  className = ele.classList[0];
  if (className === 'add-favorite') {
    var api = new XMLHttpRequest();
    api.onreadystatechange = function () {
      if (this.readyState == 4 && this.status == 200) {
        // var rs = JSON.parse(this.responseText);
        alert(this.responseText);
      }
    };
    api.open("POST", "http://localhost/BTL/api/test", true);
    api.send();

    ele.classList.remove('add-favorite');
    ele.classList.add('remove-favorite');
  }
  else {
    var api = new XMLHttpRequest();
    api.onreadystatechange = function () {
      if (this.readyState == 4 && this.status == 200) {
        // var rs = JSON.parse(this.responseText);
        alert(this.responseText);
      }
    };
    api.open("POST", "http://localhost/BTL/api/test", true);
    api.send();
    ele.classList.remove('remove-favorite');
    ele.classList.add('add-favorite');
  }
}