// sidebar.js

function toggleArticleButtons(event) {
  event.preventDefault();
  const articleButtons = document.getElementById("articleButtons");
  const arrow = document.getElementById("arrow");

  if (
    articleButtons.style.maxHeight === "0px" ||
    articleButtons.style.maxHeight === ""
  ) {
    articleButtons.style.maxHeight = articleButtons.scrollHeight + "px";
    arrow.textContent = "▲"; // Mũi tên lên
    localStorage.setItem("articleButtonsOpen", "true");
  } else {
    articleButtons.style.maxHeight = "0px";
    arrow.textContent = "▼"; // Mũi tên xuống
    localStorage.setItem("articleButtonsOpen", "false");
  }
}

function toggleDocumentButtons(event) {
  event.preventDefault();
  const documentButtons = document.getElementById("documentButtons");
  const documentArrow = document.getElementById("documentArrow");

  if (
    documentButtons.style.maxHeight === "0px" ||
    documentButtons.style.maxHeight === ""
  ) {
    documentButtons.style.maxHeight = documentButtons.scrollHeight + "px";
    documentArrow.textContent = "▲"; // Mũi tên lên
    localStorage.setItem("documentButtonsOpen", "true");
  } else {
    documentButtons.style.maxHeight = "0px";
    documentArrow.textContent = "▼"; // Mũi tên xuống
    localStorage.setItem("documentButtonsOpen", "false");
  }
}

// Khi tải lại trang, kiểm tra trạng thái đã lưu và mở submenu nếu cần
document.addEventListener("DOMContentLoaded", () => {
  const articleButtons = document.getElementById("articleButtons");
  const arrow = document.getElementById("arrow");
  const documentButtons = document.getElementById("documentButtons");
  const documentArrow = document.getElementById("documentArrow");

  if (localStorage.getItem("articleButtonsOpen") === "true") {
    articleButtons.style.maxHeight = articleButtons.scrollHeight + "px";
    arrow.textContent = "▲"; // Mũi tên lên
  }

  if (localStorage.getItem("documentButtonsOpen") === "true") {
    documentButtons.style.maxHeight = documentButtons.scrollHeight + "px";
    documentArrow.textContent = "▲"; // Mũi tên lên
  }
});
