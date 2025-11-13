package go_calc

import "testing"

func TestCalc(t *testing.T) {
	if add(2, 3) != 5 {
		t.Fatal("add failed")
	}
	if add(-2, 3) != 1 {
		t.Fatal("add failed")
	}
	if add(0.5, 0.5) != 1 {
		t.Fatal("add failed")
	}

	if sub(5, 3) != 2 {
		t.Fatal("sub failed")
	}
	if sub(2, 5) != -3 {
		t.Fatal("sub failed")
	}

	if mul(2, 3) != 6 {
		t.Fatal("mul failed")
	}
	if mul(-2, 3) != -6 {
		t.Fatal("mul failed")
	}

	if div(6, 3) != 2 {
		t.Fatal("div failed")
	}
	if div(7, 2) != 3.5 {
		t.Fatal("div failed")
	}

	defer func() {
		if r := recover(); r == nil {
			t.Fatal("division by zero not thrown")
		}
	}()
	div(1, 0)
}
