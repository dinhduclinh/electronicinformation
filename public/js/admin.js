$(document).ready(function () {
    let editContentEditorInstance;
    let addContentEditorInstance;
    let editExcerptEditorInstance;
    let addExcerptEditorInstance;

    $("#addNewBtn").click(function () {
        $("#addNewsForm").toggle();
        if (!addContentEditorInstance) {
            ClassicEditor.create(document.querySelector("#content"), {
                extraPlugins: [MyCustomUploadAdapterPlugin],
            })
            .then((editor) => {
                addContentEditorInstance = editor;
            })
            .catch((error) => {
                console.error("CKEditor initialization error for Add Form:", error);
            });
        }
        if (!addExcerptEditorInstance) {
            ClassicEditor.create(document.querySelector("#excerpt"), {
                extraPlugins: [MyCustomUploadAdapterPlugin],
            })
            .then((editor) => {
                addExcerptEditorInstance = editor;
            })
            .catch((error) => {
                console.error("CKEditor initialization error for Add Form Excerpt:", error);
            });
        }
    });


    $(".edit-btn").click(function () {
        var id = $(this).data("id");
        var category = $(this).data("category");
        var title = $(this).closest("tr").find("td:nth-child(2)").text();
        var url = $(this).closest("tr").find("td:nth-child(3)").text();
        var imageUrl = $(this).closest("tr").find("td:nth-child(4) img").attr("src");
        var content = $(this).closest("tr").find("td:nth-child(5)").html();
        var excerpt = $(this).closest("tr").find("td:nth-child(6)").html();
        var isFeatured = $(this).closest("tr").find("td:nth-child(8)").text() === "Có";
        var plainTextContent = $("<div>").html(content).text();
        var plainTextExcerpt = $("<div>").html(excerpt).text();

        $("#editId").val(id);
        $("#oldCategory").val(category); 
        $("#editCategory").val(category); 
        $("#editTitle").val(title);
        $("#editUrl").val(url);
        $("#editImageUrl").val(imageUrl);
        $("#editIsFeatured").prop("checked", isFeatured);


        $("#editNewsModal").show();

        if (editContentEditorInstance) {
            editContentEditorInstance.destroy();
        }
        if (editExcerptEditorInstance) {
            editExcerptEditorInstance.destroy();
        }

        ClassicEditor.create(document.querySelector("#editContent"), {
            extraPlugins: [MyCustomUploadAdapterPlugin],
        })
        .then((editor) => {
            editContentEditorInstance = editor;
            editor.setData(plainTextContent);
        })
        .catch((error) => {
            console.error("CKEditor initialization error for Edit Form:", error);
        });

        ClassicEditor.create(document.querySelector("#editExcerpt"), {
            extraPlugins: [MyCustomUploadAdapterPlugin],
        })
        .then((editor) => {
            editExcerptEditorInstance = editor;
            editor.setData(plainTextExcerpt);
        })
        .catch((error) => {
            console.error("CKEditor initialization error for Edit Form Excerpt:", error);
        });
    });


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
        if (editExcerptEditorInstance) {
            var excerpt = editExcerptEditorInstance.getData();
            formData += "&excerpt=" + encodeURIComponent(excerpt);
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


    $(".delete-btn").click(function () {
        var id = $(this).data("id");
        var category = $(this).data("category");
        $("#deleteId").val(id);
        $("#deleteCategory").val(category);
        $("#deleteModal").show();
    });


    $("#cancelDelete, #closeDeleteModal").click(function () {
        $("#deleteModal").hide();
    });

    $(".modal-overlay").click(function (event) {
        if ($(event.target).hasClass("modal-overlay")) {
            $("#deleteModal").hide();
        }
    });

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


    $("#addNewsForm form").submit(function (e) {
        e.preventDefault();
        console.log("Submit add form");
        var formData = $(this).serialize();
        if (addContentEditorInstance) {
            var content = addContentEditorInstance.getData();
            formData += "&content=" + encodeURIComponent(content);
        }
        if (addExcerptEditorInstance) {
            var excerpt = addExcerptEditorInstance.getData();
            formData += "&excerpt=" + encodeURIComponent(excerpt);
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

    class MyUploadAdapter {
        constructor(loader) {
            this.loader = loader;
        }
        upload() {
            return this.loader.file.then(
                (file) =>
                    new Promise((resolve, reject) => {
                        this._initRequest();
                        this._initListeners(resolve, reject, file);
                        this._sendRequest(file);
                    })
            );
        }
        abort() {
            if (this.xhr) {
                this.xhr.abort();
            }
        }
        _initRequest() {
            const xhr = (this.xhr = new XMLHttpRequest());
            xhr.open("POST", "/upload.php", true);
            xhr.responseType = "json";
        }
        _initListeners(resolve, reject, file) {
            const xhr = this.xhr;
            const loader = this.loader;
            const genericErrorText = `Couldn't upload file: ${file.name}.`;
            xhr.addEventListener("error", () => reject(genericErrorText));
            xhr.addEventListener("abort", () => reject());
            xhr.addEventListener("load", () => {
                const response = xhr.response;
                if (!response || response.error) {
                    return reject(
                        response && response.error
                            ? response.error.message
                            : genericErrorText
                    );
                }
                resolve({
                    default: response.url,
                });
            });
            if (xhr.upload) {
                xhr.upload.addEventListener("progress", (evt) => {
                    if (evt.lengthComputable) {
                        loader.uploadTotal = evt.total;
                        loader.uploaded = evt.loaded;
                    }
                });
            }
        }
        _sendRequest(file) {
            const data = new FormData();
            data.append("upload", file);
            this.xhr.send(data);
        }
    }

    function MyCustomUploadAdapterPlugin(editor) {
        editor.plugins.get("FileRepository").createUploadAdapter = (loader) => {
            return new MyUploadAdapter(loader);
        };
    }

    $("#uploadImageBtn").click(function () {
        $("#imageModal").show();
        loadImageList();
    });

    $("#editUploadImageBtn").click(function () {
        $("#imageModal").show();
        loadImageList();
    });

    $("#closeImageModal").click(function () {
        $("#imageModal").hide();
    });

    $(".modal-overlay").click(function (event) {
        if ($(event.target).hasClass("modal-overlay")) {
            $("#imageModal").hide();
        }
    });

    function loadImageList() {
        $.ajax({
            url: "list_images.php",
            type: "GET",
            success: function (response) {
                $("#imageList").empty();
                response.forEach((image) => {
                    const imageElement = $(
                        `<div class="image-item modal-image-item"><button class="delete-image-btn" data-url="${image.url}">×</button><img src="${image.url}" alt="${image.name}" width="100" height="100"></div>`
                    );
                    imageElement.click(function () {
                        const imageUrl = image.url;
                        if ($("#addNewsForm").is(":visible")) {
                            $("#image_url").val(imageUrl);
                        } else if ($("#editNewsModal").is(":visible")) {
                            $("#editImageUrl").val(imageUrl);
                        }
                        $("#imageModal").hide();
                    });
                    $("#imageList").append(imageElement);
                });
            },
            error: function (xhr, status, error) {
                console.error("Failed to load image list:", error);
            },
        });
    }


    $("#uploadNewImageBtn").click(function () {
        const fileInput = document.createElement("input");
        fileInput.type = "file";
        fileInput.accept = "image/*";
        fileInput.onchange = function (event) {
            const file = event.target.files[0];
            if (file) {
                const formData = new FormData();
                formData.append("upload", file);
                $.ajax({
                    url: "upload.php",
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response.url) {
                            if ($("#addNewsForm").is(":visible")) {
                                $("#image_url").val(response.url);
                            } else if ($("#editNewsModal").is(":visible")) {
                                $("#editImageUrl").val(response.url);
                            }

                            const imageElement = $(
                                `<div class="image-item modal-image-item"><button class="delete-image-btn" data-url="${response.url}">×</button><img src="${response.url}" alt="${file.name}" width="100" height="100"></div>`
                            );
                            imageElement.click(function () {
                                const imageUrl = response.url;
                                if ($("#addNewsForm").is(":visible")) {
                                    $("#image_url").val(imageUrl);
                                } else if ($("#editNewsModal").is(":visible")) {
                                    $("#editImageUrl").val(imageUrl);
                                }
                                $("#imageModal").hide();
                            });
                            $("#imageList").append(imageElement);
                        } else {
                            console.error("Upload failed:", response.error);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("Upload failed:", error);
                    },
                });
            }
        };
        fileInput.click();
    });

    $(document).on("click", ".delete-image-btn", function () {
        const imageUrl = $(this).data("url");
        if (confirm("Bạn có chắc chắn muốn xóa hình ảnh này?")) {
            $.ajax({
                url: "delete_image.php",
                type: "POST",
                data: { image_url: imageUrl },
                success: function (response) {
                    if (response.success) {

                        $(".image-item img[src='" + imageUrl + "']")
                            .parent()
                            .remove();
                    } else {
                        console.error("Delete failed:", response.error);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Delete failed:", error);
                },
            });
        }
    });
});