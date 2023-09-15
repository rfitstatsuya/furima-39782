window.addEventListener('turbo:load', () => {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const addTaxPrice = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    addTaxPrice.innerHTML = `${Math.floor(itemPrice.value * 0.1).toLocaleString()}`
    profit.innerHTML = `${Math.floor(itemPrice.value - itemPrice.value * 0.1).toLocaleString()}`
    });
});