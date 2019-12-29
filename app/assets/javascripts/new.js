
$(function(){
  //imageの数 削除した時とかに反映させて使用 10まで
  // var images = [];
  var images = $(".li");
  //投稿カウント 削除した数とかは反映されない 連番 無制限
  var count =0;
  //1個のimageの内容
  // var image=$(".li")

  //inputタグの配列 削除にしよう
  inputs=('.sell-upload-drop-file');

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
        <figure class="pre">
        <img src="${result}" width="100px" class="imagepre" title="${file.name} data-id="${count}">
        </figure>
        ${btn_wrapper}
        </li>`

        $('#preview').append(imagehtml);

          // $(this).children().append(btn_wrapper);

      };
    })(file);

    reader.readAsDataURL(file);

    console.log($('.sell-upload-drop-file[id$=1]'));
    // images.push(img);

    $(".sell-upload-drop-box").css(
      'width', `calc(100% - (20% * ${count}))`
    )
    console.log(count)

    var input_html=`<input class="sell-upload-drop-file" id="upload-image${count}" data-id="${count}" name="product[product_images_attributes][${count}][image_url]" type="file">`
    // labelタグのfor変える
    $(".label-image").attr('for','upload-image' + count);

    // inputタグ挿入
    $("#imageform").append(input_html);
  });


  //削除ボタン押した時のしょり
  $(document).on('click', '.btn_delete', function() {
    var target_image = $(this).parent().parent();
    var target_dataid=$(this).parent().parent().children("figure").children(".img").data('id')

    $('.sell-upload-drop-file').each(function(){
    // $.each(inputs, function(index, input){
      // if ($('.sell-upload-drop-file[id="upload-image + ${target_dataid}"]')){
      if ($(this).attr('data-image') == target_dataid){
        $(this).remove();
        target_image.remove();
        // var num = $(this).data('id');
        // images.splice(num, 1);
        // inputs.splice(num, 1);
        // if(inputs.length == 0) {
        //   $('input[type= "file"].upload-image').attr({
        //     'data-image': 0
        //   })
        // }
      }
    })
    $(".sell-upload-drop-box").css(
      'width', `calc(100% - (20% * ${count}) + 20%)`
    )

  });



});
