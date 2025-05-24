function contarVocales(cadena) {
    let vocales = "aeiouAEIOU";
    let contador = 0;
  
    for (let i = 0; i < cadena.length; i++) {
      if (vocales.includes(cadena[i])) {
        contador++;
      }
    }
  
    return contador;
  }
  
  let cadena = prompt("Ingresa una cadena:");
  console.log("La cadena tiene " + contarVocales(cadena) + " vocales.");
  