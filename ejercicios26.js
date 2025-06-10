public class Main {
    public static void main(String[] args) {
        String frase = "El sol brilla intensamente";
        String palabra = "sol";
        
        if (frase.contains(palabra)) {
            System.out.println("La palabra '" + palabra + "' está en la frase.");
        } else {
            System.out.println("La palabra '" + palabra + "' no está en la frase.");
        }
    }
}
