$(function(){
  $(document).on("ajax:success", '#mordal__signup__form', function(e){
  });
  $('#mordal__signup__form').on("ajax:error", function(e){
    console.log("error");
    $('#signup__errors li').remove();
    var detail = e.detail;
    var data = detail[0];
    var nameUl = $('.name--error');
    var emailUl = $('.email--error');
    var passwordUl = $('.password--error')
    var passwordconUl= $('.password_confirmation--error')
    data['errors']['name'].forEach(function(message){
      li = $('<li class="error-message"></li>').text(message)
      nameUl.append(li);
    });
    data['errors']['email'].forEach(function(message){
      li = $('<li class="error-message"></li>').text(message)
      emailUl.append(li);
    })
    data['errors']['password'].forEach(function(message){
      li = $('<li class="error-message"></li>').text(message)
      passwordUl.append(li);
    })
    data['errors']['password_confirmation'].forEach(function(message){
      li = $('<li class="error-message"></li>').text(message)
      passwordconUl.append(li)
    })
  });
});