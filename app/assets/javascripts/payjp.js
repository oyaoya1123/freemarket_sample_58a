document.addEventListener(
  "DOMContentLoaded", e => {
    Payjp.setPublicKey('pk_test_0c466be7ec8dce5620574429');
    let btn = document.getElementById("submit-button-card");
    btn.addEventListener("click", e => {
      e.preventDefault();
      let card = {
        number: document.getElementById("payment_card_no").value,
        cvc: document.getElementById("payment_card_security_code").value,
        exp_month: document.getElementById("payment_card_expire_mm").value,
        exp_year: document.getElementById("payment_card_expire_yy").value
      };
      Payjp.createToken(card, (status, response) => {
        if (status === 200) {
          $("#payment_card_no").removeAttr("name");
          $("#payment_card_security_code").removeAttr("name");
          $("#payment_card_expire_mm").removeAttr("name");
          $("#payment_card_expire_yy").removeAttr("name");
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          );
          document.inputForm.submit();
          alert("登録が完了しました");
        } else {
          alert("カード情報が正しくありません。");
        }
      });
    });
  },false);