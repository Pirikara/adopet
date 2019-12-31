$(function(){
  $(document).on("ajax:success", '#mordal__signup__form', function(e){
    $('#signup__errors li').remove();
    var detail = e.detail;
    var data = detail[0];
    var ul = $('#signup__errors__list');
    data['errors'].forEach(function(message){
      li = $('<li></li>').text(message);
      ul.append(li); 
    });
  });
  $('#mordal__signup__form').on("ajax:error", function(event, xhr){
    console.log("error");
  });
});