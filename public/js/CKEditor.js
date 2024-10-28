// Cấu hình CKEditor cho cả trường 'content' và 'editContent'
ClassicEditor.create(document.querySelector("#content"), {
  toolbar: {
    items: [
      "heading",
      "|",
      "bold",
      "italic",
      "link",
      "bulletedList",
      "numberedList",
      "|",
      "outdent",
      "indent",
      "|",
      "imageUpload",
      "blockQuote",
      "insertTable",
      "mediaEmbed",
      "|",
      "undo",
      "redo",
      "|",
      "alignment:left",
      "alignment:center",
      "alignment:right",
      "alignment:justify",
      "|",
      "imageStyle:full",
      "imageStyle:alignLeft",
      "imageStyle:alignCenter",
      "imageStyle:alignRight",
    ],
  },
  image: {
    // Kích hoạt các kiểu hình ảnh
    styles: [
      "full", // Hình ảnh chiếm toàn bộ chiều rộng
      "alignLeft", // Hình ảnh căn trái
      "alignCenter", // Hình ảnh căn giữa
      "alignRight", // Hình ảnh căn phải
    ],
    toolbar: [
      "imageTextAlternative", // Văn bản thay thế hình ảnh
      "|",
      "imageStyle:alignLeft", // Căn trái
      "imageStyle:alignCenter", // Căn giữa
      "imageStyle:alignRight", // Căn phải
      "|",
      "imageStyle:full", // Hình ảnh toàn bộ
    ],
  },
  alignment: {
    options: ["left", "center", "right", "justify"], // Tùy chọn căn chỉnh cho văn bản
  },
  mediaEmbed: {
    previewsInData: true, // Cho phép nhúng phương tiện
  },
}).catch((error) => {
  console.error(error);
});

ClassicEditor.create(document.querySelector("#editContent"), {
  toolbar: {
    items: [
      "heading",
      "|",
      "bold",
      "italic",
      "link",
      "bulletedList",
      "numberedList",
      "|",
      "outdent",
      "indent",
      "|",
      "imageUpload",
      "blockQuote",
      "insertTable",
      "mediaEmbed",
      "|",
      "undo",
      "redo",
      "|",
      "alignment:left",
      "alignment:center",
      "alignment:right",
      "alignment:justify",
      "|",
      "imageStyle:full",
      "imageStyle:alignLeft",
      "imageStyle:alignCenter",
      "imageStyle:alignRight",
    ],
  },
  image: {
    styles: [
      "full", // Hình ảnh chiếm toàn bộ chiều rộng
      "alignLeft", // Hình ảnh căn trái
      "alignCenter", // Hình ảnh căn giữa
      "alignRight", // Hình ảnh căn phải
    ],
    toolbar: [
      "imageTextAlternative", // Văn bản thay thế hình ảnh
      "|",
      "imageStyle:alignLeft", // Căn trái
      "imageStyle:alignCenter", // Căn giữa
      "imageStyle:alignRight", // Căn phải
      "|",
      "imageStyle:full", // Hình ảnh toàn bộ
    ],
  },
  alignment: {
    options: ["left", "center", "right", "justify"],
  },
  mediaEmbed: {
    previewsInData: true,
  },
}).catch((error) => {
  console.error(error);
});
