public class ConvertirMinusculas {
    public static String convertirAMinusculas(String cadena) {
        return cadena.toLowerCase();
    }

    public static void main(String[] args) {
        String texto = "Hola Mundo";
        System.out.println("Texto en minúsculas: " + convertirAMinusculas(texto));
    }
}