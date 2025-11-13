import unittest
import calc

class TestCalc(unittest.TestCase):
    def test_add(self):
        self.assertEqual(calc.add(2, 3), 5)
        self.assertAlmostEqual(calc.add(2.5, 0.5), 3.0, places=6)

    def test_sub(self):
        self.assertEqual(calc.sub(5, 3), 2)

    def test_mul(self):
        self.assertEqual(calc.mul(4, 5), 20)

    def test_div(self):
        self.assertEqual(calc.div(10, 2), 5)
        with self.assertRaises(ZeroDivisionError):
            calc.div(1, 0)

if __name__ == "__main__":
    unittest.main(verbosity=2)
