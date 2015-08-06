$(document).ready(function() {
  var add_button = $(".add-button");

  $(add_button).click(function(){
    $(this).removeClass("add-button");
    $(this).prop("disabled", true);
    $(".hidden").first().removeClass("hidden");
    add_button = $(".add-button").first();
  });


});
