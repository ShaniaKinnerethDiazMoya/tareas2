public class SumaArray {
    public static int sumarElementos(int[] array) {
        int suma = 0;
        for (int numero : array) {
            suma += numero;
        }
        return suma;
    }

    public static void main(String[] args) {
        int[] numeros = {1, 2, 3, 4, 5};
        System.out.println("La suma de los elementos del array es: " + sumarElementos(numeros));
    }
}