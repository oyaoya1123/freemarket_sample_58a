
$(function(){
  // var images = [];
  var count =0;
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $(document).on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader();
    count=count+1;

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      console.log(file);
      return function(e) {
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        // $('#preview').append($('<img>').attr({
        //           src: e.target.result,
        //           width: "120px",
        //           class: 'imagepre'+ count,
                                    
        //           title: file.name,
        //           'data-id': count
        //       }));
        var result=e.target.result
        var btn_wrapper = `<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>`;
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

    // images.push(img);

    $(".sell-upload-drop-box").css(
      'width', `calc(100% - (20% * ${count}))`
    )
    console.log(count)

    var input_html=`<input class="sell-upload-drop-file" id="upload-image${count}" name="product[product_images_attributes][${count}][image_url]" type="file">`
    // labelタグのfor変える
    $(".label-image").attr('for','upload-image' + count);

    // inputタグ挿入
    $("#imageform").append(input_html);
  });
});
