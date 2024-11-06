$(document).ready(function () {
  $(".news-link").on("mouseenter", function () {
    var title = $(this).data("title");

    var image = $(this).data("image");

    $("#main-news-title").text(title); 

    $("#main-news-image img").attr("src", image);
  });
});
$(document).ready(function () {
  const carouselInner = $("#carousel");
  const items = $(".carousel-item");
  const totalItems = items.length;
  let currentIndex = 0;
  let interval;

  items.clone().appendTo(carouselInner);
  items.clone().prependTo(carouselInner);

  const itemWidth = items.outerWidth(true);
  const totalWidth = totalItems * 3 * itemWidth;
  carouselInner.css("width", totalWidth);

  const startPosition = -totalItems * itemWidth;
  carouselInner.css("transform", `translateX(${startPosition}px)`);

  function startCarousel() {
    interval = setInterval(() => {
      moveCarousel(1);
    }, 4000);
  }

  function stopCarousel() {
    clearInterval(interval);
  }
  function moveCarousel(direction) {
    currentIndex += direction;

    const newPosition = startPosition + currentIndex * -itemWidth;

    carouselInner.css("transition", "transform 0.5s ease-in-out");
    carouselInner.css("transform", `translateX(${newPosition}px)`);

    if (currentIndex >= totalItems || currentIndex <= -totalItems) {
      setTimeout(() => {
        carouselInner.css("transition", "none");
        currentIndex = 0;
        carouselInner.css("transform", `translateX(${startPosition}px)`);
      }, 500);
    }
  }

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

  startCarousel();
});


    document.addEventListener("DOMContentLoaded", function() {
        var list = document.getElementById('latestNewsList');
        var listHeight = list.scrollHeight; 
        var scrollingElement = document.querySelector('.scrolling-news'); 
        var speed = 80; 
        var step = 1; 

        scrollingElement.scrollTop = listHeight;

        function autoScroll() {
            if (scrollingElement.scrollTop <= 0) {               
                scrollingElement.scrollTop = listHeight;
            } else {
                scrollingElement.scrollTop -= step;
            }
        }

        var scrolling = setInterval(autoScroll, speed);

        scrollingElement.addEventListener('mouseover', function() {
            clearInterval(scrolling);
        });

        scrollingElement.addEventListener('mouseout', function() {
            scrolling = setInterval(autoScroll, speed);
        });
    });




