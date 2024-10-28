$(document).ready(function () {
  // Khi người dùng di chuột vào một tiêu đề tin tức
  $(".news-link").on("mouseenter", function () {
    // Lấy dữ liệu từ thuộc tính data của tin tức được hover
    var title = $(this).data("title");

    var image = $(this).data("image");

    // Cập nhật phần bảng tin chính với thông tin mới
    $("#main-news-title").text(title); // Thay đổi tiêu đề

    $("#main-news-image img").attr("src", image); // Thay đổi hình ảnh
  });
});
$(document).ready(function () {
  const carouselInner = $("#carousel");
  const items = $(".carousel-item");
  const totalItems = items.length;
  let currentIndex = 0;
  let interval;

  // Clone các phần tử đầu và cuối để tạo vòng lặp vô hạn
  items.clone().appendTo(carouselInner);
  items.clone().prependTo(carouselInner);

  // Tính toán lại độ rộng tổng của các item
  const itemWidth = items.outerWidth(true);
  const totalWidth = totalItems * 3 * itemWidth;
  carouselInner.css("width", totalWidth);

  // Đặt vị trí bắt đầu giữa phần tử gốc
  const startPosition = -totalItems * itemWidth;
  carouselInner.css("transform", `translateX(${startPosition}px)`);

  // Chuyển động tự động
  function startCarousel() {
    interval = setInterval(() => {
      moveCarousel(1);
    }, 4000);
  }

  // Dừng carousel khi di chuột vào
  function stopCarousel() {
    clearInterval(interval);
  }

  // Hàm để di chuyển carousel
  function moveCarousel(direction) {
    currentIndex += direction;

    const newPosition = startPosition + currentIndex * -itemWidth;

    carouselInner.css("transition", "transform 0.5s ease-in-out");
    carouselInner.css("transform", `translateX(${newPosition}px)`);

    // Reset vị trí nếu đến cuối hoặc đầu (khi sử dụng clone)
    if (currentIndex >= totalItems || currentIndex <= -totalItems) {
      setTimeout(() => {
        carouselInner.css("transition", "none");
        currentIndex = 0;
        carouselInner.css("transform", `translateX(${startPosition}px)`);
      }, 500);
    }
  }

  // Điều khiển bằng nút Back và Next
  $("#prevBtn").click(() => {
    stopCarousel();
    moveCarousel(-1);
    startCarousel();
  });

  $("#nextBtn").click(() => {
    stopCarousel();
    moveCarousel(1);
    startCarousel();
  });

  // Bắt đầu chuyển động tự động
  startCarousel();
});


    document.addEventListener("DOMContentLoaded", function() {
        var list = document.getElementById('latestNewsList');
        var listHeight = list.scrollHeight; // Chiều cao của danh sách tin tức
        var scrollingElement = document.querySelector('.scrolling-news'); // Phần tử chứa tin
        var speed = 80; // Tốc độ cuộn (giá trị càng lớn, tốc độ càng chậm)
        var step = 1; // Mỗi lần cuộn bao nhiêu px

        // Thiết lập chiều cao ban đầu
        scrollingElement.scrollTop = listHeight;

        function autoScroll() {
            if (scrollingElement.scrollTop <= 0) {
                // Khi cuộn tới đầu danh sách, quay về cuối
                scrollingElement.scrollTop = listHeight;
            } else {
                // Cuộn ngược lên
                scrollingElement.scrollTop -= step;
            }
        }

        // Khởi động tự động cuộn
        var scrolling = setInterval(autoScroll, speed);

        // Tạm dừng khi di chuột vào phần tin tức
        scrollingElement.addEventListener('mouseover', function() {
            clearInterval(scrolling);
        });

        // Tiếp tục cuộn khi di chuột ra khỏi phần tin tức
        scrollingElement.addEventListener('mouseout', function() {
            scrolling = setInterval(autoScroll, speed);
        });
    });




