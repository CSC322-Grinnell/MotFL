
$(document).on('turbolinks:load', function() {
    $('.js-example-basic-multiple').select2({ width: '10%', tags: true });
});

$(document).ready(function() {
  $(".js-example-basic-single").select2();
  $(".js-example-basic-single").on("change", function(e) {
    var data = $(this).val();
    if (data == 0) {
    alert("nothing selected");
    } else {
    console.log(data);
    alert(data);
    }
  });
});