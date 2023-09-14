window.addEventListener('turbo:load', () => {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const addTaxPrice = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    addTaxPrice.innerHTML = `${Math.round(itemPrice.value * 0.1).toLocaleString()}`
    profit.innerHTML = `${Math.round(itemPrice.value - itemPrice.value * 0.1).toLocaleString()}`
    });
});