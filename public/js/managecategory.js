$(document).ready(function () {
  $(".edit-category-btn").click(function () {
    var id = $(this).data("id");
    var name = $(this).data("name");
    $("#editCategoryId").val(id);
    $("#editCategoryName").val(name);
    $("#editCategoryModal").show();
  });

  $("#closeEditCategoryModal").click(function () {
    $("#editCategoryModal").hide();
  });
});
