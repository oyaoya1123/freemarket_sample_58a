document.addEventListener(
  "DOMContentLoaded", e => {
    //if (document.getElementById('submit-button-card') != null) { //submit-button-cardというidがnullの場合、下記コードを実行しない
      Payjp.setPublicKey('pk_test_0c466be7ec8dce5620574429'); //ここに公開鍵を直書き
      let btn = document.getElementById("submit-button-card"); //IDがtoken_submitの場合に取得されます
      console.log('ボタンの取得');
      btn.addEventListener("click", e => { //ボタンが押されたときに作動します
        e.preventDefault(); //ボタンを一旦無効化します
        let card = {
          number: document.getElementById("payment_card_no").value,
          cvc: document.getElementById("payment_card_security_code").value,
          exp_month: document.getElementById("payment_card_expire_mm").value,
          exp_year: document.getElementById("payment_card_expire_yy").value
        }; //入力されたデータを取得します。
        console.log(card);
        console.log('入力されたカード情報を取得');
        let test = document.getElementById("payment_card_no").value;
        console.log(test);
        let test2 = document.getElementById("payment_card_security_code").value;
        console.log(test2);
        let test3 = document.getElementById("payment_card_expire_mm").value;
        console.log(test3);
        let test4 = document.getElementById("payment_card_expire_yy").value;
        console.log(test4);
        Payjp.createToken(card, (status, response) => {
          console.log("レスポンスチェック");
          if (status === 200) { //成功した場合
            $("#payment_card_no").removeAttr("name");
            $("#payment_card_security_code").removeAttr("name");
            $("#payment_card_expire_mm").removeAttr("name");
            $("#payment_card_expire_yy").removeAttr("name"); //データを自サーバにpostしないように削除
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            ); //取得したトークンを送信できる状態にします
            document.inputForm.submit();
            alert("登録が完了しました"); //確認用
          } else {
            console.log("ステータスチェック");
            console.log(status);
            alert("カード情報が正しくありません。"); //確認用
          }
        });
      });
    //}
  },false);