
$(function(){
  //imageの数 削除した時とかに反映させて使用 10まで
  var images = [];
  var img = $(".imagepre");
  //投稿カウント 削除した数とかは反映されない 連番 無制限
  var count =0;
  //inputタグの配列 削除にしよう
  inputs=('.sell-upload-drop-file');
  //画像領域
  var dropbox1=$(".state-image-number-1")
  var dropbox2=$(".state-image-number-2")
  //ラベル領域・ドラッグ&ドロップ領域
  var imagebox1=$(".have-item-1")
  var imagebox2=$(".have-item-2")

  //ileを選択時に発火するイベントを登録
  $(document).on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader();
        
    count=count+1;

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      console.log(file);
      return function(e) {

        var result=e.target.result
        var btn_wrapper = `<div class="btn_wrapper"><button class="btn_edit">編集</button><button class="btn_delete">削除</button></div>`;
        var imagehtml=
        `<li>
        <div class="pre">
        <img src="${result}" width="100px" class="imagepre" data-id="${count}">
        </div>
        ${btn_wrapper}
        </li>`

        //images6~10まで
        if(images.length >= 6) {
          $('#preview2').append(imagehtml);
          }
        else{
          $('#preview').append(imagehtml);
        }
        
      };
    })(file);

    reader.readAsDataURL(file);
    //imagesに追加
    images.push(img);

    //inputタグ挿入用
    var input_html=`<input class="sell-upload-drop-file" id="upload-image${count}" data-id="${count}" name="product[product_images_attributes][${count}][image_url]" type="file">`

    //条件分岐
    console.log(images.length);
    if(images.length >= 5) {
      dropbox2.removeClass('notactive');
      dropbox2.addClass('active');
      imagebox1.removeClass('active');
      imagebox1.addClass('notactive');
      imagebox2.removeClass('notactive');
      imagebox2.addClass('active');

        imagebox2.css(
          'width', `calc(100% - (20% * (${images.length} - 5)))`
        )
      // labelタグのfor変える
      $(".label-image").attr('for','upload-image' + count);
      // inputタグ挿入
      $("#imageform2").append(input_html);

      if(images.length >= 10){
        imagebox2.removeClass('active');
        imagebox2.addClass('notactive');
      }

      }
    else if(images.length <= 4){
        imagebox1.css(
          'width', `calc(100% - (20% * ${images.length}))`
        )
    // labelタグのfor変える
    $(".label-image").attr('for','upload-image' + count);
    // inputタグ挿入
    $("#imageform1").append(input_html);

    }

  });


  //削除ボタン押した時のしょり
  $(document).on('click', '.btn_delete', function() {
    var target_image = $(this).parent().parent();
    var target_dataid=$(this).parent().parent().children(".pre").children(".imagepre").attr('data-id')
    
    $('.sell-upload-drop-file').each(function(index,element){

      if ($(this).attr('data-id') == target_dataid){
        $(this).remove();
        target_image.remove();
        var num = $(this).attr('data-id');
        images.splice(num-1, 1);
      }
    })

    //条件分岐

    if(images.length >= 5) {
      // var dropbox=$(".sell-dropbox-container")
      // dropbox.attr(".notactive",".active");

      imagebox2.css(
        'width', `calc(100% - (20% * (${images.length} - 5)))`
      )

      if(images.length==9){
        imagebox2.removeClass('notactive');
        imagebox2.addClass('active');
      }

    }else if(images.length<=4){
      dropbox2.removeClass('active');
      dropbox2.addClass('notactive');
      imagebox2.removeClass('active');
      imagebox2.addClass('notactive');
      imagebox1.removeClass('notactive');
      imagebox1.addClass('active');
      
      imagebox1.css(
        'width', `calc(100% - (20% * ${images.length}))`
      )
    }
  }) ;
});
