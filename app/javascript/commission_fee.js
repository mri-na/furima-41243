const price = () => {
    const priceInput = document.getElementById("item-price");
    const addTaxDom = document.getElementById("add-tax-price");
    const addTaxPrice = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
      console.log(inputValue);
      addTaxDom.innerHTML = Math.floor(inputValue * 0.1 );
      addTaxPrice.innerHTML = Math.floor( inputValue - inputValue * 0.1 );
  })
  };
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
  