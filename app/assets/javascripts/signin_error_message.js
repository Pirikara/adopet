$(function(){
  $(document).on('ajax:success', '#mordal__signin__form', function(e){
    console.log("success");
  });
  $(document).on('ajax:error', '#mordal__signin__form', function(e){
    $('#signin__errors li').remove();
    var detail = e.detail;
    var data = detail[0];
    console.log(data)
    var ul = $('#signin__errors__list');
    li = $('<li></li>').text(data);
    ul.append(li);
  });
});