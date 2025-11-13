public class Calculator {
    public static double add(double b, double a) { return a + b; } // addition
    public static double sub(double b, double a) { return a - b; } // subtraction
    public static double mul(double b, double a) { return a * b; } // multiplication
    public static double div(double a, double b) {
        if (b == 0.0) throw new ArithmeticException("division by zero"); // throw
        return a / b;
    }
}
