function CalculateUnitPrice () {

  for (let idx = 1; idx <= 3; idx++){
    const price = document.getElementById(`price${idx}`);
    const unit = document.getElementById(`unit${idx}`);
    const unitPrice = document.getElementById(`unit-price${idx}`);

    price.addEventListener('input', calculate)
    unit.addEventListener('input', calculate)

    function calculate () {
      const inputPrice = price.value;
      const inputUnit = unit.value;
  
      if (inputPrice && inputUnit) {
        const result = inputPrice / inputUnit;
        unitPrice.innerHTML = `${Math.floor(result).toLocaleString()}円`;
      } else if (inputPrice) {
        unitPrice.innerHTML = "個数を入力(半角)";
      } else if (inputUnit) {
        unitPrice.innerHTML = "価格を入力(半角)";
      } else {
        unitPrice.innerHTML = "価格と個数を入力(半角)";
      }
    }
  }
}

window.addEventListener('turbo:load', CalculateUnitPrice);