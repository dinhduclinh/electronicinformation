$(document).ready(function () {

    let editContentEditorInstance;
    let addContentEditorInstance;

    // Hiển thị form thêm mới
    $("#addNewBtn").click(function () {
        $("#addNewsForm").toggle();

        if (!addContentEditorInstance) {
            ClassicEditor.create(document.querySelector("#content"), {
                ckfinder: {
                    uploadUrl: 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json'
                }
            })
            .then((editor) => {
                addContentEditorInstance = editor; 
            })
            .catch((error) => {
                console.error("CKEditor initialization error for Add Form:", error);
            });
        }
    });

    // Hiển thị modal chỉnh sửa
    $(".edit-btn").click(function () {
        var id = $(this).data("id");
        var category = $(this).data("category"); 
        var title = $(this).closest("tr").find("td:nth-child(2)").text();
        var url = $(this).closest("tr").find("td:nth-child(3)").text();
        var imageUrl = $(this)
            .closest("tr")
            .find("td:nth-child(4) img")
            .attr("src");
        var content = $(this).closest("tr").find("td:nth-child(5)").html();
        var isFeatured =
            $(this).closest("tr").find("td:nth-child(7)").text() === "Có"; 


        var plainTextContent = $("<div>").html(content).text();

        $("#editId").val(id);
        $("#editCategory").val(category); 
        $("#editTitle").val(title);
        $("#editUrl").val(url);
        $("#editImageUrl").val(imageUrl);
        $("#editIsFeatured").prop("checked", isFeatured); 

        // Hiển thị modal
        $("#editNewsModal").show();

        if (editContentEditorInstance) {
            editContentEditorInstance.destroy(); 
        }
        ClassicEditor.create(document.querySelector("#editContent"), {
            ckfinder: {
                uploadUrl: 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json'
            }
        })
        .then((editor) => {
            editContentEditorInstance = editor;
            editor.setData(plainTextContent); 
        })
        .catch((error) => {
            console.error("CKEditor initialization error for Edit Form:", error);
        });
    });

    // Đóng modal chỉnh sửa
    $("#closeEditModal").click(function () {
        $("#editNewsModal").hide();
        if (editContentEditorInstance) {
            editContentEditorInstance.destroy(); 
            editContentEditorInstance = null; 
        }
    });
    $(".modal-overlay").click(function (event) {
        if ($(event.target).hasClass("modal-overlay")) {
            $("#editNewsModal").hide();
            if (editContentEditorInstance) {
                editContentEditorInstance.destroy();
                editContentEditorInstance = null; 
            }
        }
    });

    $("#editNewsModal form").submit(function (e) {
        e.preventDefault(); 
        console.log("Submit edit form"); 
        var formData = $(this).serialize();

        if (editContentEditorInstance) {
            var content = editContentEditorInstance.getData(); 
            formData += "&content=" + encodeURIComponent(content); 
        }

        var isFeatured = $("#editIsFeatured").prop("checked") ? "true" : "false";
        formData += "&is_featured=" + isFeatured;
        console.log("Form data:", formData);
        $.ajax({
            url: "admin.php", 
            type: "POST", 
            data: formData, 
            success: function (response) {
                console.log("Edit successful:", response);
                location.reload(); 
            },
            error: function (xhr, status, error) {
                console.error("Edit failed:", error);
            },
        });
    });

    // Hiển thị modal xóa
    $(".delete-btn").click(function () {
        var id = $(this).data("id");
        var category = $(this).data("category"); 
        $("#deleteId").val(id);
        $("#deleteCategory").val(category); 
        $("#deleteModal").show(); 
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
        e.preventDefault(); 
        console.log("Submit delete form"); 
        var formData = $(this).serialize();
        console.log("Form data:", formData);
        $.ajax({
            url: "admin.php", 
            type: "POST",
            data: formData,
            success: function (response) {
                console.log("Delete successful:", response);
                location.reload();
            },
            error: function (xhr, status, error) {
                console.error("Delete failed:", error);
            },
        });
    });

    // Xử lý sự kiện submit form thêm tin
    $("#addNewsForm form").submit(function (e) {
        e.preventDefault(); 
        console.log("Submit add form"); 
        var formData = $(this).serialize();

        if (addContentEditorInstance) {
            var content = addContentEditorInstance.getData();
            formData += "&content=" + encodeURIComponent(content); 
        }

        var isFeatured = $("#is_featured").prop("checked") ? "true" : "false";
        formData += "&is_featured=" + isFeatured;
        console.log("Form data:", formData);
        $.ajax({
            url: "admin.php", 
            type: "POST", 
            data: formData, 
            success: function (response) {
                console.log("Add successful:", response);
                location.reload(); 
            },
            error: function (xhr, status, error) {
                console.error("Add failed:", error);
            },
        });
    });
});