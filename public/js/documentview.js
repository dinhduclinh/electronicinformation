document.addEventListener("DOMContentLoaded", function () {
  var list = document.getElementById("documentList");
  var listHeight = list.scrollHeight; 
  var scrollingElement = document.querySelector(".scrolling-documents"); 
  var speed = 80; 
  var step = 1; 
  var isScrolling = false;

  scrollingElement.scrollTop = listHeight;

  function autoScroll() {
    if (scrollingElement.scrollTop <= 0) {

      scrollingElement.scrollTop = listHeight;
    } else {
      scrollingElement.scrollTop -= step;
    }
    if (isScrolling) {
      requestAnimationFrame(autoScroll);
    }
  }

  function startScrolling() {
    isScrolling = true;
    requestAnimationFrame(autoScroll);
  }

  function stopScrolling() {
    isScrolling = false;
  }

  scrollingElement.addEventListener("mouseover", function () {
    stopScrolling();
  });

  scrollingElement.addEventListener("mouseout", function () {
    startScrolling();
  });

  startScrolling();
});
