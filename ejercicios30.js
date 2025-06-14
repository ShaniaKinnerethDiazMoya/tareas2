import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        int[] numeros = {10, 20, 30, 40};
        int nuevoElemento = 50;

        // Crear un nuevo array con el nuevo elemento
        int[] nuevoArray = Arrays.copyOf(numeros, numeros.length + 1);
        nuevoArray[numeroArray.length - 1] = nuevoElemento;

        System.out.println("Array después de agregar el elemento: " + Arrays.toString(nuevoArray));
    }
}
