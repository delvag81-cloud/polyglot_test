<?php
require_once __DIR__ . "/calc.php";

function assertEqual($got, $want, $msg) {
    if ($got !== $want) {
        fwrite(STDERR, "FAIL: $msg (got=$got, want=$want)\n");
        exit(1);
    }
}

try {
    assertEqual(add(2,3), 5, "add");
    assertEqual(sub(5,3), 2, "sub");
    assertEqual(mul(4,5), 20, "mul");
    assertEqual(div(10,2), 5, "div");
    $threw = false;
    try { div(1,0); } catch (DivisionByZeroError $e) { $threw = true; }
    if (!$threw) { throw new Exception("Expected DivisionByZeroError"); }
    echo "All PHP tests passed\n";
} catch (Throwable $e) {
    fwrite(STDERR, $e->getMessage() . "\n");
    exit(1);
}
