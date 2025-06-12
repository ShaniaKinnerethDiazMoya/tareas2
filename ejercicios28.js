import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        int[] numeros = {10, 20, 30, 40, 50};
        int elemento = 30;
        int indice = Arrays.binarySearch(numeros, elemento);

        if (indice >= 0) {
            System.out.println("El índice del elemento es: " + indice);
        } else {
            System.out.println("Elemento no encontrado.");
        }
    }
}
