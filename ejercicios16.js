public class Rango {
    public static boolean estaEnRango(int numero, int limiteInferior, int limiteSuperior) {
        return numero >= limiteInferior && numero <= limiteSuperior;
    }

    public static void main(String[] args) {
        int numero = 5;
        int limiteInferior = 1;
        int limiteSuperior = 10;
        System.out.println("El número está en el rango: " + estaEnRango(numero, limiteInferior, limiteSuperior));
    }
}