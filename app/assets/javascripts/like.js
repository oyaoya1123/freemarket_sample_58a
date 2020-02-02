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
      // var iconChange = document.getElementsByClassName("heart")
      // console.log(iconChange)
      // iconChange[0].className = "fas fa-heart";
      // 通信に成功した場合の処理です
      var bbb = document.getElementsByClassName("like2");
    //     bbb[0].removeClass('like2').addClass('unlike2');
      bbb[0].textContent = "いいね！" ;
      bbb[0].className = "unlike2";

      var likeCount = document.getElementsByClassName("count-up")
      likeCount[0].textContent = Number(likeCount[0].textContent) + 1
      likeCount[0].className = "count-down"

    })
    .fail(function(){
      // 通信に失敗した場合の処理です
      alert("失敗しました"); // alertで検索失敗の旨を表示します
    })
  })
})