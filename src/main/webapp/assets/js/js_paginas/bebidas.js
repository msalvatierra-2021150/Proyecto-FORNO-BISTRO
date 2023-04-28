document.addEventListener('click', function handleClick(event) {
    
  });

$('.botonSuma').click(function(){
    let numero = Number(mostrador.value.trim(" "));
    numero = !isNaN(numero) ? numero + 1 : 1;

    mostrador.value = numero;
});

$('.botonResta').click(function(){
    let numero = Number(mostrador.value.trim(" "));
    numero = !isNaN(numero) ? numero - 1 : 1;

    mostrador.value = numero;
});
