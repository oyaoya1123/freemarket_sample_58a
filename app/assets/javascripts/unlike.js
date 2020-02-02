$(function(){
  $(document).on("click", ".unlike2", function(){ 
    var product_id = $("#product_id").val(); 
    $.ajax({
      type:"DELETE",
      url: `/products/${product_id}/likes`,
      data: {product_id: product_id}, 
      dataType: "json" 
    })
    .done(function(){

      var aaa = document.getElementsByClassName("unlike2")

      aaa[0].textContent = "いいね！";
      aaa[0].className = "like2";

      var likeCount = document.getElementsByClassName("count-down")
      likeCount[0].textContent = Number(likeCount[0].textContent) - 1
      likeCount[0].className = "count-up"
    })
    .fail(function(){
      alert("失敗しました") 
    })
  })
})
