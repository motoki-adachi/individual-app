$(function(){
  $(".search-list").change(function(){
    let action = $(this).val();
    $(".form-inline").attr("action", action);
  });
});