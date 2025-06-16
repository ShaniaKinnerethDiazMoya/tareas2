import java.util.Arrays;
import java.util.Collections;

public class Main {
    public static void main(String[] args) {
        Integer[] numeros = {10, 20, 30, 40, 50};
        
        // Usamos Arrays.asList para convertir el array a una lista y Collections.reverse para invertirlo
        Collections.reverse(Arrays.asList(numeros));
        
        System.out.println("Array invertido: " + Arrays.toString(numeros));
    }
}
