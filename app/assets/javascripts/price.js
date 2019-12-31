function priceChange() {
  const taxRate = 0.1
  const price = document.getElementById("price").value;
  const taxPrice = price * taxRate
  const profit = price - price * taxRate
  if(taxPrice >= 1){
    document.getElementById("pricetax").innerText = taxPrice;
    document.getElementById("profit").innerText = profit;
  }
  if(price < 10 || price === ""){
    document.getElementById("pricetax").innerText = "-";
    document.getElementById("profit").innerText = "-";
  }
  

}