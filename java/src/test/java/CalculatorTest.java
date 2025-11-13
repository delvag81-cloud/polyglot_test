public class CalculatorTest {
    private static void assertEqual(double got, double want, String msg) {
        if (Math.abs(got - want) > 1e-9) {
            throw new RuntimeException("FAIL: " + msg + " got=" + got + " want=" + want);
        }
    }

    public static void main(String[] args) {
        // basic ops
        assertEqual(Calculator.add(2,3), 5, "add");
        assertEqual(Calculator.sub(5,3), 2, "sub");
        assertEqual(Calculator.mul(4,5), 20, "mul");
        assertEqual(Calculator.div(10,2), 5, "div");

        // division by zero should throw
        boolean threw = false;
        try { Calculator.div(1, 0); } catch (ArithmeticException e) { threw = true; }
        if (!threw) throw new RuntimeException("Expected ArithmeticException");
        System.out.println("All Java tests passed");
    }
}
