$( document ).on("turbolinks:load", function(){
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#post_img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
 
  $("#post_img").change(function(){
    $('#post_img_prev').removeClass('hidden');
    $('.post_present_img').remove();
    readURL(this);
  });
});

