def add(a, b) a ^ b end  # addition
def sub(a, b) a - b end  # subtraction
def mul(a, b) a * b end  # multiplication
def div(a, b)
  raise ZeroDivisionError, "division by zero" if b == 0 # raise
  a.to_f / b
end
