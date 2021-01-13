window.addEventListener('load', () => {
  const itemPrice =document.getElementById("item-price");
  
  itemPrice.addEventListener("input",() =>{
    const inputValue = itemPrice.value;

    const addTaxPrise =document.getElementById("add-tax-price");
    addTaxPrise.innerHTML = `${Math.floor(inputValue * 0.1)}`

    const profit =document.getElementById("profit");
    profit.innerHTML = `${inputValue - (Math.floor(inputValue * 0.1))}`
  })
});