function priceChange() {
  const taxRate = 0.1
  const price = document.getElementById("price").value;
  document.getElementById("pricetax").innerText = price * taxRate
  document.getElementById("profit").innerText = price - price * taxRate
}