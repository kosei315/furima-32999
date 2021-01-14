window.addEventListener('load', () => {
  console.log("OK");

// 金額を入力した数値をpriceInputという変数に格納する
const itemPrice = document.getElementById("item-price");
itemPrice.addEventListener("input", () => {
  const inputValue = itemPrice.value;
  const addTaxPrice2 = Math.floor(inputValue*0.1);
  const profit2 = Math.floor(inputValue*0.9);
// 金額を入力した数値をpriceInputという変数に格納する
const addTaxPrice = document.getElementById("add-tax-price");
addTaxPrice.innerHTML =addTaxPrice2
// 金額を入力した数値をpriceInputという変数に格納する
const profit = document.getElementById("profit");
profit.innerHTML =profit2
});
});