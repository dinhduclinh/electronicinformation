$(document).ready(function () {
  // Biến toàn cục để lưu instance của CKEditor
  let editContentEditorInstance;
  let addContentEditorInstance;

  // Hiển thị form thêm mới
  $("#addNewBtn").click(function () {
    $("#addNewsForm").toggle();
    // Khởi tạo CKEditor cho trường nội dung thêm mới sau khi hiển thị form
    if (!addContentEditorInstance) {
      ClassicEditor.create(document.querySelector("#content"))
        .then((editor) => {
          addContentEditorInstance = editor; // Lưu instance của CKEditor cho form thêm
        })
        .catch((error) => {
          console.error("CKEditor initialization error for Add Form:", error);
        });
    }
  });

  // Hiển thị modal chỉnh sửa
  $(".edit-btn").click(function () {
    var id = $(this).data("id");
    var category = $(this).data("category"); // Lấy category từ data-category
    var title = $(this).closest("tr").find("td:nth-child(2)").text();
    var url = $(this).closest("tr").find("td:nth-child(3)").text();
    var imageUrl = $(this)
      .closest("tr")
      .find("td:nth-child(4) img")
      .attr("src");
    var content = $(this).closest("tr").find("td:nth-child(5)").html();
    var isFeatured =
      $(this).closest("tr").find("td:nth-child(7)").text() === "Có"; // Lấy giá trị is_featured từ cột mới

    // Chuyển đổi nội dung HTML thành văn bản thuần
    var plainTextContent = $("<div>").html(content).text();

    // Cập nhật giá trị cho các trường trong modal
    $("#editId").val(id);
    $("#editCategory").val(category); // Cập nhật category
    $("#editTitle").val(title);
    $("#editUrl").val(url);
    $("#editImageUrl").val(imageUrl);
    $("#editIsFeatured").prop("checked", isFeatured); // Cập nhật trạng thái checkbox tin nổi bật

    // Hiển thị modal
    $("#editNewsModal").show();

    // Khởi tạo CKEditor cho trường nội dung sau khi modal được hiển thị
    if (editContentEditorInstance) {
      editContentEditorInstance.destroy(); // Hủy CKEditor trước đó nếu có
    }
    ClassicEditor.create(document.querySelector("#editContent"))
      .then((editor) => {
        editContentEditorInstance = editor; // Lưu instance của CKEditor
        editor.setData(plainTextContent); // Tải dữ liệu vào CKEditor
      })
      .catch((error) => {
        console.error("CKEditor initialization error for Edit Form:", error);
      });
  });

  // Đóng modal chỉnh sửa
  $("#closeEditModal").click(function () {
    $("#editNewsModal").hide();
    if (editContentEditorInstance) {
      editContentEditorInstance.destroy(); // Hủy CKEditor khi đóng modal
      editContentEditorInstance = null; // Reset CKEditor instance
    }
  });

  $(".modal-overlay").click(function (event) {
    if ($(event.target).hasClass("modal-overlay")) {
      $("#editNewsModal").hide();
      if (editContentEditorInstance) {
        editContentEditorInstance.destroy(); // Hủy CKEditor khi đóng modal
        editContentEditorInstance = null; // Reset CKEditor instance
      }
    }
  });

  // Xử lý sự kiện submit form chỉnh sửa tin
  $("#editNewsModal form").submit(function (e) {
    e.preventDefault(); // Ngăn form submit mặc định
    console.log("Submit edit form"); // Log thông tin khi submit
    var formData = $(this).serialize();

    // Lấy dữ liệu từ CKEditor
    if (editContentEditorInstance) {
      var content = editContentEditorInstance.getData(); // Lấy dữ liệu từ CKEditor
      formData += "&content=" + encodeURIComponent(content); // Thêm nội dung vào formData
    }

    // Lấy giá trị của checkbox tin nổi bật
    var isFeatured = $("#editIsFeatured").prop("checked") ? "true" : "false";
    formData += "&is_featured=" + isFeatured;

    console.log("Form data:", formData);

    $.ajax({
      url: "admin.php", // Đường dẫn đến file PHP xử lý
      type: "POST", // Phương thức gửi dữ liệu
      data: formData, // Dữ liệu từ form
      success: function (response) {
        console.log("Edit successful:", response);
        location.reload(); // Tải lại trang sau khi thành công
      },
      error: function (xhr, status, error) {
        console.error("Edit failed:", error);
      },
    });
  });

  // Hiển thị modal xóa
  $(".delete-btn").click(function () {
    var id = $(this).data("id");
    var category = $(this).data("category"); // Lấy category từ data-category
    $("#deleteId").val(id);
    $("#deleteCategory").val(category); // Cập nhật category
    $("#deleteModal").show(); // Hiển thị modal xóa
  });

  // Đóng modal xóa
  $("#cancelDelete, #closeDeleteModal").click(function () {
    $("#deleteModal").hide();
  });

  $(".modal-overlay").click(function (event) {
    if ($(event.target).hasClass("modal-overlay")) {
      $("#deleteModal").hide();
    }
  });

  // Xử lý sự kiện submit form xóa tin
  $("#deleteModal form").submit(function (e) {
    e.preventDefault(); // Ngăn form submit mặc định
    console.log("Submit delete form"); // Log thông tin khi submit
    var formData = $(this).serialize();
    console.log("Form data:", formData);
    $.ajax({
      url: "admin.php", // Đường dẫn đến file PHP xử lý
      type: "POST",
      data: formData,
      success: function (response) {
        console.log("Delete successful:", response);
        location.reload(); // Tải lại trang sau khi thành công
      },
      error: function (xhr, status, error) {
        console.error("Delete failed:", error);
      },
    });
  });

  // Xử lý sự kiện submit form thêm tin
  $("#addNewsForm form").submit(function (e) {
    e.preventDefault(); // Ngăn form submit mặc định
    console.log("Submit add form"); // Log thông tin khi submit
    var formData = $(this).serialize();

    // Lấy dữ liệu từ CKEditor
    if (addContentEditorInstance) {
      var content = addContentEditorInstance.getData(); // Lấy dữ liệu từ CKEditor
      formData += "&content=" + encodeURIComponent(content); // Thêm nội dung vào formData
    }

    // Lấy giá trị của checkbox tin nổi bật
    var isFeatured = $("#is_featured").prop("checked") ? "true" : "false";
    formData += "&is_featured=" + isFeatured;

    console.log("Form data:", formData);

    $.ajax({
      url: "admin.php", // Đường dẫn đến file PHP xử lý
      type: "POST", // Phương thức gửi dữ liệu
      data: formData, // Dữ liệu từ form
      success: function (response) {
        console.log("Add successful:", response);
        location.reload(); // Tải lại trang sau khi thành công
      },
      error: function (xhr, status, error) {
        console.error("Add failed:", error);
      },
    });
  });
});
