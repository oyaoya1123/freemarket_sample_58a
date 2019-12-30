
$(function(){
  //imageの数 削除した時とかに反映させて使用 10まで
  var images = [];
  var img = $(".imagepre");
  //投稿カウント 削除した数とかは反映されない 連番 無制限
  var count =0;
  //inputタグの配列 削除にしよう
  inputs=('.sell-upload-drop-file');
  var dropbox1=$(".state-image-number-1")
  var dropbox2=$(".state-image-number-2")
  var imagebox1=$(".have-item-1")
  var imagebox2=$(".have-item-2")

  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
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

        //images4~9まで
        if(images.length >= 6) {
          $('#preview2').append(imagehtml);
          }
        else{
          $('#preview').append(imagehtml);
        }
        
      };
    })(file);

    reader.readAsDataURL(file);
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

      imagebox2.css(
        'width', `calc(100% - (20% * ${images.length} - 5))`
      )

      }
    else{
        imagebox1.css(
          'width', `calc(100% - (20% * ${images.length}))`
        )
    }
    // labelタグのfor変える
    $(".label-image").attr('for','upload-image' + count);
    // inputタグ挿入
    $("#imageform").append(input_html);

  });


  //削除ボタン押した時のしょり
  $(document).on('click', '.btn_delete', function() {
    var target_image = $(this).parent().parent();
    var target_dataid=$(this).parent().parent().children(".pre").children(".imagepre").attr('data-id')
    
    $('.sell-upload-drop-file').each(function(index,element){

    // $.each(inputs, function(index, input){
      // if ($('.sell-upload-drop-file[id="upload-image + ${target_dataid}"]')){
      if ($(this).attr('data-id') == target_dataid){
        $(this).remove();
        target_image.remove();
        var num = $(this).attr('data-id');
        images.splice(num-1, 1);
        // inputs.splice(num, 1);
        // if(inputs.length == 0) {
        //   $('input[type= "file"].upload-image').attr({
        //     'data-image': 0
        //   })
        // }
        console.log(images.length);
        console.log(inputs.length);
      }
    })

    //条件分岐
    // $(".sell-upload-drop-box").css(
    //   'width', `calc(100% - (20% * ${images.length}))`)

    if(images.length >= 5) {
      var dropbox=$(".sell-dropbox-container")
      dropbox.attr(".notactive",".active");

      imagebox2.css(
        'width', `calc(100% - (20% * ${images.length} - 5))`
      )

    }else{
      dropbox2.removeClass('active');
      dropbox2.addClass('notactive');
      imagebox1.removeClass('notactive');
      imagebox1.addClass('active');
      
      imagebox1.css(
        'width', `calc(100% - (20% * ${images.length}))`
      )

    }


  });



});
