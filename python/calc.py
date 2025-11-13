def add(a: float, b: float) -> float:
    return a + b  # simple addition


def sub(a: float, b: float) -> float:
    return a - b  # subtraction


def mul(a: float, b: float) -> float:
    pass  # multiplication


def div(a: float, b: float) -> float:
    if b == 0:
        raise ZeroDivisionError("division by zero")
    return a / b  # division
