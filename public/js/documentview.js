document.addEventListener("DOMContentLoaded", function () {
  var list = document.getElementById("documentList");
  var listHeight = list.scrollHeight; // Chiều cao của danh sách văn bản
  var scrollingElement = document.querySelector(".scrolling-documents"); // Phần tử chứa văn bản
  var speed = 80; // Tốc độ cuộn (giá trị càng lớn, tốc độ càng chậm)
  var step = 1; // Mỗi lần cuộn bao nhiêu px
  var isScrolling = false;

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
    if (isScrolling) {
      requestAnimationFrame(autoScroll);
    }
  }

  // Khởi động tự động cuộn
  function startScrolling() {
    isScrolling = true;
    requestAnimationFrame(autoScroll);
  }

  // Dừng cuộn
  function stopScrolling() {
    isScrolling = false;
  }

  // Tạm dừng khi di chuột vào phần văn bản
  scrollingElement.addEventListener("mouseover", function () {
    stopScrolling();
  });

  // Tiếp tục cuộn khi di chuột ra khỏi phần văn bản
  scrollingElement.addEventListener("mouseout", function () {
    startScrolling();
  });

  // Bắt đầu cuộn tự động
  startScrolling();
});
