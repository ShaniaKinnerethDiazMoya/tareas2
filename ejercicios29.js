import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        int[] numeros = {10, 20, 30, 40, 50};
        int eliminar = 30;

        // Crear un nuevo array sin el elemento a eliminar
        int[] nuevoArray = Arrays.stream(numeros)
                                 .filter(num -> num != eliminar)
                                 .toArray();
        
        System.out.println("Array después de eliminar el elemento: " + Arrays.toString(nuevoArray));
    }
}
