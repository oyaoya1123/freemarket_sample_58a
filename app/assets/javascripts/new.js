$(document).ready( function(){
  // ページ読み込み時に実行したい処理
  var p_images = [];
  //imageの数
  var p_imgs = $(".imagepre");
  n=p_imgs.length
  var imgnum=0;
  
  //画像領域
  var dropbox1=$(".state-image-number-1")
  var dropbox2=$(".state-image-number-2")
  //ラベル領域・ドラッグ&ドロップ領域
  var imagebox1=$(".have-item-1")
  var imagebox2=$(".have-item-2")
  //inputタグ
  var p_input=$('.sell-upload-drop-file')

  //5マイ以下の場合
  if(p_imgs.length <= 5) {
  //imageにdata-id番号フル
  p_imgs.each(function(index) {
    console.log($(this));
    $(this).attr('data-id', imgnum);
    imgnum=imgnum+1
  });
  //既存inputタグにdata-image番号フル
  //inputタグdata-id変更・labelタグのfor変更
  var imgnum=0;
  $(".label-image").attr('for','upload-image' + n);
  p_input.each(function(index) {
    console.log($(this));
    $(this).attr('data-id', imgnum);
    $(this).attr('data-image', imgnum);
    //hiddenタグにdata-imageフル（削除用）
    $(this).next(".destroy").attr('data-image', imgnum);
    imgnum=imgnum+1
  });
  // inputタグ挿入
  if(p_imgs.length == 0){
  }else{
  var input_html=`<input class="sell-upload-drop-file" id="upload-image${n}" data-id="${n}" name="product[product_images_attributes][${n}][image_url]" type="file">`
  $("#imageform1").append(input_html);
  //ドロップエリアの範囲変更
  imagebox1.css(
    'width', `calc(100% - (20% * ${n}))`
  )
  }

  }
});


$(function(){
  //imageの数 削除した時とかに反映させて使用 10まで
  var images = [];
  var img = $(".imagepre");
  //投稿カウント 削除した数とかは反映されない 連番 無制限
  var count =img.length;
  console.log(count)
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
        
    // count=count+1;

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {

        var result=e.target.result
        var btn_wrapper = `<div class="btn_wrapper"><button class="btn_edit">編集</button><button class="btn_delete">削除</button></div>`;
        var imagehtml=
        `<li>
        <div class="pre">
        <img src="${result}" width="100px" class="imagepre" data-id="${count -1}">
        </div>
        ${btn_wrapper}
        </li>`

        //images6~10まで
        if(count >= 6) {
          $('#preview2').append(imagehtml);
          }
        else{
          $('#preview').append(imagehtml);
        }
        
      };
    })(file);

    reader.readAsDataURL(file);

    count=count+1;
    //inputタグ挿入用
    var input_html=`<input class="sell-upload-drop-file" id="upload-image${count}" data-id="${count}" name="product[product_images_attributes][${n+1}][image_url]" type="file">`
    n=n+1
    //条件分岐
    console.log(count);
    if(count >= 5) {
      dropbox2.removeClass('notactive');
      dropbox2.addClass('active');
      imagebox1.removeClass('active');
      imagebox1.addClass('notactive');
      imagebox2.removeClass('notactive');
      imagebox2.addClass('active');

        imagebox2.css(
          'width', `calc(100% - (20% * (${count} - 5)))`
        )
      // labelタグのfor変える
      $(".label-image").attr('for','upload-image' + count);
      // inputタグ挿入
      $("#imageform2").append(input_html);

      if(count >= 10){
        imagebox2.removeClass('active');
        imagebox2.addClass('notactive');
      }

      }
    else if(count <= 4){
        imagebox1.css(
          'width', `calc(100% - (20% * ${count}))`
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


    count=count-1
    console.log(count)
    $('.sell-upload-drop-file').each(function(index,element){

      if ($(this).attr('data-id') == target_dataid){
        //既存画像の場合destroy追加
        if($(this).attr('data-image')==$(this).next(".destroy").attr('data-image')){
          $(this).next('.destroy').attr('value', '1')        
        }
        $(this).remove();
        target_image.remove();
        var num = $(this).attr('data-id');
        // images.splice(num-1, 1);

      }
    })

    //条件分岐
    var img = $(".imagepre");
    if(images.length >= 5) {

      imagebox2.css(
        'width', `calc(100% - (20% * (${images.length} - 5)))`
      )

      if(images.length==9){
        imagebox2.removeClass('notactive');
        imagebox2.addClass('active');
      }

    }else if(count<=4){
      dropbox2.removeClass('active');
      dropbox2.addClass('notactive');
      imagebox2.removeClass('active');
      imagebox2.addClass('notactive');
      imagebox1.removeClass('notactive');
      imagebox1.addClass('active');

      //データID振り直し count:イメージの数
      var imgnum=0;
      console.log(img);
      img.each(function(index) {
        console.log($(this));
        $(this).attr('data-id', imgnum);
        imgnum=imgnum+1
      });

      //inputタグdata-id,idの振り直し
      var imgnum=0;
      $('.sell-upload-drop-file').each(function(index) {
        console.log($(this));
        $(this).attr('data-id', imgnum);
        $(this).attr('id', "upload-image" + imgnum);
        imgnum=imgnum+1
      });
      //forの値変更
      $(".label-image").attr('for','upload-image' + count);
      
      imagebox1.css(
        'width', `calc(100% - (20% * ${count}))`
      )
    }
  }) ;
});
