let min = parseInt(prompt("Ingresa el número mínimo:"));
let max = parseInt(prompt("Ingresa el número máximo:"));

let numeroAleatorio = Math.floor(Math.random() * (max - min + 1)) + min;
console.log("Número aleatorio: " + numeroAleatorio);
