import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Main {
    public static void main(String[] args) {
        LocalDate fecha1 = LocalDate.of(2023, 1, 1);
        LocalDate fecha2 = LocalDate.of(2024, 1, 1);

        long diferenciaDias = ChronoUnit.DAYS.between(fecha1, fecha2);
        System.out.println("Diferencia en días: " + diferenciaDias); // 365
    }
}
