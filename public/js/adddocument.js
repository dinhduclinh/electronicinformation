$(document).ready(function () {
  $("#addDocumentForm form").submit(function (e) {
    e.preventDefault();
    console.log("Submit add document form");
    var formData = new FormData(this);
    console.log("Form data:", formData);
    $.ajax({
      url: "adddocument.php",
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
