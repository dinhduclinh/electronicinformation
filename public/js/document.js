$(document).ready(function () {
  // Hiển thị form thêm mới
  $("#addNewBtn").click(function () {
    $("#addDocumentForm").toggle();
  });

  // Hiển thị modal chỉnh sửa
  $(".edit-btn").click(function () {
    var id = $(this).data("id");
    var documentNumber = $(this).closest("tr").find("td:nth-child(2)").text();
    var issuedDate = $(this).closest("tr").find("td:nth-child(3)").text();
    var excerpt = $(this).closest("tr").find("td:nth-child(4)").text();
    var attachmentUrl = $(this)
      .closest("tr")
      .find("td:nth-child(5) a")
      .attr("href");
    var signer = $(this).closest("tr").find("td:nth-child(6)").text();
    var documentTypeId = $(this)
      .closest("tr")
      .find("td:nth-child(7)")
      .data("type-id");

    $("#editId").val(id);
    $("#editDocumentNumber").val(documentNumber);
    $("#editIssuedDate").val(issuedDate);
    $("#editExcerpt").val(excerpt);
    $("#editAttachmentUrlDisplay").text(attachmentUrl); // Hiển thị đường dẫn tệp đính kèm
    $("#editSigner").val(signer);

    // Đặt giá trị cho trường "Loại văn bản" bằng cách chọn tùy chọn tương ứng
    $("#editDocumentTypeId").val(documentTypeId);

    // Hiển thị modal
    $("#editDocumentModal").show();
  });

  // Đóng modal chỉnh sửa
  $("#closeEditModal").click(function () {
    $("#editDocumentModal").hide();
  });

  $(".modal-overlay").click(function (event) {
    if ($(event.target).hasClass("modal-overlay")) {
      $("#editDocumentModal").hide();
    }
  });

  $("#editDocumentModal form").submit(function (e) {
    e.preventDefault();
    console.log("Submit edit document form");
    var formData = new FormData(this);
    console.log("Form data:", formData);
    $.ajax({
      url: "documents.php",
      type: "POST",
      data: formData,
      processData: false,
      contentType: false,
      success: function (response) {
        console.log("Edit document successful:", response);
        location.reload();
      },
      error: function (xhr, status, error) {
        console.error("Edit document failed:", error);
      },
    });
  });

  // Hiển thị modal xóa
  $(".delete-btn").click(function () {
    var id = $(this).data("id");
    $("#deleteDocumentId").val(id);
    $("#deleteDocumentModal").show();
  });

  // Đóng modal xóa
  $("#cancelDeleteDocument, #closeDeleteDocumentModal").click(function () {
    $("#deleteDocumentModal").hide();
  });

  $(".modal-overlay").click(function (event) {
    if ($(event.target).hasClass("modal-overlay")) {
      $("#deleteDocumentModal").hide();
    }
  });

  // Xử lý sự kiện submit form xóa văn bản
  $("#deleteDocumentModal form").submit(function (e) {
    e.preventDefault();
    console.log("Submit delete document form");
    var formData = $(this).serialize();
    console.log("Form data:", formData);
    $.ajax({
      url: "documents.php",
      type: "POST",
      data: formData,
      success: function (response) {
        console.log("Delete document successful:", response);
        location.reload();
      },
      error: function (xhr, status, error) {
        console.error("Delete document failed:", error);
      },
    });
  });

  // Xử lý sự kiện submit form thêm văn bản
  $("#addDocumentForm form").submit(function (e) {
    e.preventDefault();
    console.log("Submit add document form");
    var formData = new FormData(this);
    console.log("Form data:", formData);
    $.ajax({
      url: "documents.php",
      type: "POST",
      data: formData,
      processData: false,
      contentType: false,
      success: function (response) {
        console.log("Add document successful:", response);
        location.reload();
      },
      error: function (xhr, status, error) {
        console.error("Add document failed:", error);
      },
    });
  });

  // Handle category filter change
  $("#documentTypeFilter").change(function () {
    const selectedType = $(this).val();
    filterDocumentsByType(selectedType);
  });

  // Function to filter documents by type
  function filterDocumentsByType(type) {
    const rows = $("#document-list table tbody tr");
    rows.each(function () {
      const rowType = $(this).data("type-id");
      if (type === "all" || rowType == type) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });
  }

  // Initialize the filter with "all" type
  filterDocumentsByType("all");

  function removeVietnameseDiacritics(str) {
    str = str.toLowerCase();
    str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
    str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
    str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
    str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
    str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
    str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
    str = str.replace(/đ/g, "d");
    return str;
  }

  // Handle search input change
  $("#searchInput").on("input", function () {
    const searchTerm = $(this).val().toLowerCase();
    const searchTermWithoutDiacritics = removeVietnameseDiacritics(searchTerm);
    searchDocuments(searchTerm, searchTermWithoutDiacritics);
  });

  // Function to search documents by keyword
  function searchDocuments(keyword, keywordWithoutDiacritics) {
    const rows = $("#document-list table tbody tr");
    rows.each(function () {
      const documentNumber = $(this)
        .find("td:nth-child(2)")
        .text()
        .toLowerCase();
      const issuedDate = $(this).find("td:nth-child(3)").text().toLowerCase();
      const excerpt = $(this).find("td:nth-child(4)").text().toLowerCase();
      const signer = $(this).find("td:nth-child(6)").text().toLowerCase();
      const documentType = $(this).find("td:nth-child(7)").text().toLowerCase();

      const documentNumberWithoutDiacritics =
        removeVietnameseDiacritics(documentNumber);
      const excerptWithoutDiacritics = removeVietnameseDiacritics(excerpt);
      const signerWithoutDiacritics = removeVietnameseDiacritics(signer);
      const documentTypeWithoutDiacritics =
        removeVietnameseDiacritics(documentType);

      if (
        documentNumber.includes(keyword) ||
        documentNumberWithoutDiacritics.includes(keywordWithoutDiacritics) ||
        issuedDate.includes(keyword) ||
        excerpt.includes(keyword) ||
        excerptWithoutDiacritics.includes(keywordWithoutDiacritics) ||
        signer.includes(keyword) ||
        signerWithoutDiacritics.includes(keywordWithoutDiacritics) ||
        documentType.includes(keyword) ||
        documentTypeWithoutDiacritics.includes(keywordWithoutDiacritics)
      ) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });
  }
});
