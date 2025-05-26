import java.util.Scanner;

public class CelsiusToFahrenheit {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Ingresa los grados Celsius: ");
        double celsius = scanner.nextDouble();

        // Fórmula de conversión: Fahrenheit = Celsius * 9/5 + 32
        double fahrenheit = (celsius * 9/5) + 32;

        System.out.println(celsius + " grados Celsius son " + fahrenheit + " grados Fahrenheit.");
    }
}
