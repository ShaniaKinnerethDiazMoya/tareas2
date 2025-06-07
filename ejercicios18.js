public class PromedioArray {
    public static double calcularPromedio(int[] array) {
        int suma = 0;
        for (int numero : array) {
            suma += numero;
        }
        return (double) suma / array.length;
    }

    public static void main(String[] args) {
        int[] numeros = {1, 2, 3, 4, 5};
        System.out.println("El promedio de los elementos del array es: " + calcularPromedio(numeros));
    }
}