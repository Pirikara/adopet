$(function(){

  function buildImage(loadedImageUrl){
    let counter = 0
    $('.iu-preview-box__text__delete').each(function(){
      counter++;
    });
    let html =
    `<li class="iu-preview-box">
      <figure class="iu-preview-box__image">
        <img src=${loadedImageUrl}>
      </figure>
      <div class="iu-preview-box__text">
        <a class="iu-preview-box__text__delete" data-id="${counter}">
          削除
        </a>
      </div>
    </li>`
    return html
  };

  //画像が5枚アップロードされたらドロップエリアを消す
  function hideDropArea(){
    if (images_array.length >= 5){
      $(DropArea1).css({
        'display' : 'none'
      })
    }
    else{
      $(DropArea1).css({
        'display' : 'block'
      })
    }
  }
  
  let DropArea1 = '.animal-form__container__drop-area'
  let PreviewArea = '.animal-form__container__preview-area__images ul'
  let images_array = []

  //ドロップダウン投稿機能
  $(DropArea1).on({'dragenter dragover' :function(e){
    e.preventDefault();
    },
    'drop' :function(e){
      e.preventDefault();
      let images = e.originalEvent.dataTransfer.files;
      for (let i = 0; i < images.length; i++){
        images_array.push(images[i]);
        let fileReader = new FileReader();
        //読み込みが成功した時にfunctionを起動
        fileReader.onload = function(e){
          //画像のURLを取得
          let loadedImageUrl = e.target.result
          //HTMLに画像を放り込む
          $(buildImage(loadedImageUrl)).appendTo(PreviewArea).trigger('create')
          $('.iu-preview-box__text__delete').each(function(a){
            a = a + 1;
            var have_image = `have-image-${a}`
            var had_image = `have-image-${a - 1}`
            if($(DropArea1).hasClass(had_image)){
              $(DropArea1).removeClass(had_image);
              $(DropArea1).addClass(have_image);
            }else{
              $(DropArea1).addClass(have_image);
            };
          });
        };
        //画像ファイルの読み込みを行う
        fileReader.readAsDataURL(images[i])
      }
      hideDropArea();
    },  
  });

  //クリック投稿機能
  $(DropArea1).on('change', 'input[type="file"]', function(e){
    e.preventDefault();
    let images = $(this).prop('files')
      for (let i = 0; i < images.length; i++){
        images_array.push(images[i]);
        let fileReader = new FileReader();
        fileReader.onload = function(e){
          var loadedImageUrl = e.target.result
          $(buildImage(loadedImageUrl)).appendTo(PreviewArea).trigger('create')
          $('.iu-preview-box__text__delete').each(function(a){
            a = a + 1;
            var have_image = `have-image-${a}`
            var had_image = `have-image-${a - 1}`
            if($(DropArea1).hasClass(had_image)){
              $(DropArea1).removeClass(had_image);
              $(DropArea1).addClass(have_image);
            }else{
              $(DropArea1).addClass(have_image);
            };
          });
        };
        fileReader.readAsDataURL(images[i])
      }
    hideDropArea();
  })

  //プレビュー画像の削除機能
  //動的に追加された要素に対しては、documentを指定して一旦全ページを読み込ませる
  $(document).on('click', '.iu-preview-box__text__delete', function(e){
    e.preventDefault();
    //clickした要素のdata-idを取得
    let index = $(this).data('id');
    //clickした要素のliがulのなかで何番目かを取得
    let array_number = $(this).parent().parent().index();
    //削除ボタンの親の親(li)を削除する
    $(`a[data-id='${index}']`).parent().parent().remove();
    //spliceメソッドで画像配列の中からarray_number番目の画像を1つ削除する
    images_array.splice(array_number, 1);
    let list_count = $('li').length - 3
    let have_preview = `have-image-${list_count}`
    let had_preview = `have-image-${list_count + 1}`
    $(DropArea1).removeClass(had_preview)
    $(DropArea1).addClass(have_preview)
    hideDropArea();
  });
});
