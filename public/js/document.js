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
});
