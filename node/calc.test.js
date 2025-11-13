const assert = require('assert')
const { add, sub, mul, div } = require('./calc')

try {
  assert.strictEqual(add(2,3), 5)
  assert.strictEqual(sub(5,3), 2)
  assert.strictEqual(mul(4,5), 20)
  assert.strictEqual(div(10,2), 5)
  let threw = false
  try { div(1,0) } catch (e) { threw = true }
  assert.ok(threw, "expected division by zero to throw")
  console.log("All Node.js tests passed")
} catch (e) {
  console.error(e)
  process.exit(1)
}
