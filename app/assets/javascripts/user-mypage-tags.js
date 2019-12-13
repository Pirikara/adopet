document.addEventListener("turbolinks:load", function(){
  $(function(){
    $('.tab-group li').click(function(){
      console.log("success")
      //クリックしたタブからインデックス番号を取得
      var index = $('.tab-group li').index(this)

      //display: none;とdisplay: flex;を付け替えることで切り替え
      $('.is-show').removeClass('is-show');
      $('.giving-animals').eq(index).addClass('is-show');
      //タブについて、クラスにis-activeを付け替えることでcssを変更
      $('.tab-group li').removeClass('is-active');
      $('.tab-group li').eq(index).addClass('is-active')
    });
  });
});