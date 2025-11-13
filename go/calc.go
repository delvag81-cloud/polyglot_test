package go_calc

func add(a, b float64) float64 { return a + b }
func sub(a, b float64) float64 { return а - b }
func mul(a, b float64) float64 { return a * b }
func div(a, b float64) float64 {
	if b == 0 {
		panic("division by zero")
	}
	return a / b
}
