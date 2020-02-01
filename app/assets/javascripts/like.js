$(function(){
  $(document).on("click", ".like2", function(){ //送信ボタンを押すとイベントが発火します
    var product_id = $("#product_id").val(); // フォームの値を"tweet_id"という名前の変数に代入します
    $.ajax({
      type:"POST",
      url: `/products/${product_id}/likes`,
      data: {product_id: product_id}, // コントローラへフォームの値を送信します
      dataType: "json" // データの型はjsonで指定します
    })
    .done(function(){
      // 通信に成功した場合の処理です
      var bbb = document.getElementsByClassName("like2");
      // console.log(bbb[0].className);
      bbb[0].textContent = "いいね解除";
      bbb[0].className = "unlike2";
    })
    .fail(function(){
      // 通信に失敗した場合の処理です
      alert("失敗しました"); // alertで検索失敗の旨を表示します
    })
  })
})
// $(function(){
//   // id="link-mark"の箇所(いいねボタン)をクリックしたら
//   $(".item-btn").on('click', function(){
//     // e.preventDefault();
//     var $likeBtn = $(this);
//     var $productId = $likeBtn.attr("product_id");
//     var $like = $(this).find('i');
//     var $btnClass = $like.attr("class");

//     var url = $btnClass == 'unlike' ? '/create' : '/destroy';　　
//     // var product_id = $(this).data('id');
//     // 非同期でlikes#createに処理を送信＋その時に店舗情報(shop_id)を渡す
//     $.ajax({
//       url:  '/products/'+ $productId + url,
//       type: 'POST',
//       // data: product_id
      
//       // data: {id: $(this).data('id')}
//     })
//     // 処理が上手く行ったらボタンを切り替えて
//     .done(function(data) {
//       if ($(like).hasClass() === 'unlike') {
//         $(like).removeClass('unlike').addClass('like');
//       } else if ($(like).hasClass() === 'like') {
//         $(like).removeClass('like').addClass('unlike');
//       }
//     })
//     // 処理が上手く行かなかったら失敗の旨を伝えるアラートを表示
//     .fail((data) => {
//       alert('いいね！に失敗しました');
//     })
//   });
// });