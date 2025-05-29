import java.util.Scanner;

public class NumeroMasGrande {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("¿Cuántos números quieres ingresar? ");
        int cantidad = scanner.nextInt();
        int[] numeros = new int[cantidad];

        for (int i = 0; i < cantidad; i++) {
            System.out.print("Ingresa el número " + (i + 1) + ": ");
            numeros[i] = scanner.nextInt();
        }

        int maximo = numeros[0];
        for (int i = 1; i < numeros.length; i++) {
            if (numeros[i] > maximo) {
                maximo = numeros[i];
            }
        }

        System.out.println("El número más grande es: " + maximo);
    }
}
