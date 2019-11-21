// $(document).on('turbolinks:load', function() {  //出品ページに遷移後リロード
//   var path = location.pathname;
//   var secondHtml = `<div class="sell-upload-items second">
//                     <ul class="pictures"></ul>
//                   </div>`
//   if(path == "/animals/new"){
//     $('.form-mask-image-new:first').removeClass('box-display-none-new') //最初のdropbox以外を非表示
//      $(document).on('change', 'input[type="file"]', function(e) { //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
//       $preview = $(this).parent(); //fileの親要素を$preview_newに代入
//       previewfile(e,$preview) //プレビューを生成
//       $(this).parent().parent().parent().addClass("box-display-none-new"); //dropbox非表示
//       $(this).parent().parent().parent().next('.form-mask-image-new').removeClass("box-display-none-new"); //次のdropbox表示
//     })
//     function previewfile(e,$preview) {
//       var file = e.target.files[0],
//           reader = new FileReader();
//       var i = 0;
//       if(file.type.indexOf("image") < 0){ //image以外はfalse
//         return false;
//       }
//       reader.onload = (function(file) {
//         return function(e){
//           var html_whole_new = `<li class="sell-upload-item">
//                                   <figure class="sell-upload-figure landscape">
//                                     <img class="preview" style="vertical-align:middle" src="${e.target.result}" style={"width":100%}>
//                                   </figure>
//                                   <div class="sell-upload-button">
//                                     <a href="#" class="sell-upload-edit">編集</a>
//                                     <a href="#" id="sell-upload-delete${i}">削除</a>
//                                   </div>
//                                 </li>`
//           $preview.parent().parent().after(html_whole_new)
//           $preview.parent().parent().next().children().children('img').attr({
//             src: e.target.result,
//             width: "100%",
//             height: "100%",
//             class: "preview"
//           })
          
//           var previewCount = $('.preview').length; //previewの数によってdropboxのwidthを変更
//           if  (previewCount == 1 || previewCount == 6){
//             $('.form-mask-image-new').width(490);
//           } else if (previewCount == 2 || previewCount == 7){
//             $('.form-mask-image-new').width(360);
//           } else if (previewCount == 3 || previewCount == 8){
//             $('.form-mask-image-new').width(230);
//           } else if (previewCount == 4 || previewCount == 9){
//             $('.form-mask-image-new').width(100);
//           } else if (previewCount == 5){
//             $('.form-mask-image-new').width(620);
//           } else if (previewCount == 10){
//             $('.form-mask-image-new').addClass('box-display-none-new');
//           }

//           $("#sell-upload-delete" + i).click(function(){
//             var c = $(this).parent().parent().prev().children().children()
//             c.val('');
//             $(this).parent().parent().prev().children().children().replaceWith(c);
//             $(this).parent().parent().prev().hide();
//             $(this).parent().parent().prev().appendTo('.sell-dropbox-container');
//             c.remove();
//           });
//           i += 1
//         };
//       })(file);
//       reader.readAsDataURL(file);
//     }
//   }
// })