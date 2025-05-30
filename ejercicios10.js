import java.util.Scanner;

public class DivisiblePor3y5 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Ingresa un número: ");
        int numero = scanner.nextInt();

        if (numero % 3 == 0 && numero % 5 == 0) {
            System.out.println(numero + " es divisible por 3 y 5.");
        } else {
            System.out.println(numero + " no es divisible por 3 y 5.");
        }
    }
}
