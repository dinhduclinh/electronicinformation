document.addEventListener("DOMContentLoaded", function () {
  const modal = document.getElementById("voteResultsModal");
  const btn = document.getElementById("resultsBtn");
  const span = document.getElementsByClassName("close")[0];

  // Khi bấm nút "Kết quả" thì hiển thị modal
  btn.onclick = function () {
    modal.style.display = "block";
  };

  // Khi bấm vào dấu "X" thì đóng modal
  span.onclick = function () {
    modal.style.display = "none";
  };

  // Khi bấm ra ngoài modal thì cũng đóng modal
  window.onclick = function (event) {
    if (event.target === modal) {
      modal.style.display = "none";
    }
  };

});
