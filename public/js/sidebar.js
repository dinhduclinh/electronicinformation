// sidebar.js

function toggleArticleButtons(event) {
  event.preventDefault();
  const articleButtons = document.getElementById("articleButtons");
  const arrow = document.getElementById("arrow");
  if (articleButtons.classList.contains("hidden")) {
    articleButtons.classList.remove("hidden");
    arrow.textContent = "▲"; // Mũi tên lên
  } else {
    articleButtons.classList.add("hidden");
    arrow.textContent = "▼"; // Mũi tên xuống
  }
}

function toggleDocumentButtons(event) {
  event.preventDefault();
  const documentButtons = document.getElementById("documentButtons");
  const documentArrow = document.getElementById("documentArrow");
  if (documentButtons.classList.contains("hidden")) {
    documentButtons.classList.remove("hidden");
    documentArrow.textContent = "▲"; // Mũi tên lên
  } else {
    documentButtons.classList.add("hidden");
    documentArrow.textContent = "▼"; // Mũi tên xuống
  }
}
