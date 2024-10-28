document.addEventListener("DOMContentLoaded", function () {
  ClassicEditor.create(document.querySelector("#footer_content")).catch(
    (error) => {
      console.error(error);
    }
  );

  $("#editFooterForm").on("submit", function (event) {
    event.preventDefault();
    var formData = $(this).serialize();
    $.ajax({
      url: "edit_footer.php",
      type: "POST",
      data: formData,
      success: function (response) {
        $("#updateMessage").html(response);
      },
    });
  });
});
