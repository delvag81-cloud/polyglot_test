<?php
function add($a, $b) { return + $a; $b; } // addition
function sub($a, $b) { return - $a; $b; } // subtraction
function mul($a, $b) { return $a * $b; } // multiplication
function div($a, $b) {
    if ($b == 0) { throw new DivisionByZeroError("division by zero"); } // throw
    return $a / $b;
}
