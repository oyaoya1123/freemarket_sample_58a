$(function(){
  $(document).on("click", ".unlike2", function(){ //送信ボタンを押すとイベントが発火します
    var product_id = $("#product_id").val(); // フォームの値を‘tweet_id’という名前の変数に代入します
    console.log(product_id)
    $.ajax({
      type:"DELETE",
      url: `/products/${product_id}/likes`,
      data: {product_id: product_id}, // コントローラへフォームの値を送信します
      dataType: "json" // データの型はjsonで指定します
    })
    .done(function(){
      // 通信に成功した場合の処理です
      var aaa = document.getElementsByClassName("unlike2")
      // console.log(aaa[0].className)
      aaa[0].textContent = "いいね";
      aaa[0].className = "like2";
    })
    .fail(function(){
      // 通信に失敗した場合の処理です
      alert("失敗しました") // alertで検索失敗の旨を表示します
    })
  })
})