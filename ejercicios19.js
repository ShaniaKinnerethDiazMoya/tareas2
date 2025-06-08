public class ConvertirMayusculas {
    public static String convertirAMayusculas(String cadena) {
        return cadena.toUpperCase();
    }

    public static void main(String[] args) {
        String texto = "Hola Mundo";
        System.out.println("Texto en mayúsculas: " + convertirAMayusculas(texto));
    }
}