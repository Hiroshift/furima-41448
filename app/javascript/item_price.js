const price = () => {
 
  const priceInput = document.getElementById("item-price");
  const taxOutput = document.getElementById("add-tax-price");
  const profitOutput = document.getElementById("profit");
 
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const tax = Math.floor(inputValue * 0.1);
    taxOutput.innerHTML = `${tax}`;

    const profit = inputValue - tax;
    profitOutput.innerHTML = `${profit}`;
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);


