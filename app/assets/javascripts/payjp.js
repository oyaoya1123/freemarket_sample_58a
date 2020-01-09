document.addEventListener(
  "DOMContentLoaded", e => {
      Payjp.setPublicKey('pk_test_0c466be7ec8dce5620574429'); //ここに公開鍵を直書き
      let btn = document.getElementById("submit-button-card"); //IDがtoken_submitの場合に取得されます
      btn.addEventListener("click", e => { //ボタンが押されたときに作動します
        e.preventDefault(); //ボタンを一旦無効化します
        let card = {
          number: document.getElementById("payment_card_no").value,
          cvc: document.getElementById("payment_card_security_code").value,
          exp_month: document.getElementById("payment_card_expire_mm").value,
          exp_year: document.getElementById("payment_card_expire_yy").value
        }; //入力されたデータを取得します。
        Payjp.createToken(card, (status, response) => {
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
            alert("カード情報が正しくありません。"); //確認用
          }
        });
      });
  },false);