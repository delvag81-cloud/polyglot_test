require 'minitest/autorun'
require_relative './calc'

class CalcTest < Minitest::Test
  def test_add
    assert_equal 5, add(2,3)
  end
  def test_sub
    assert_equal 2, sub(5,3)
  end
  def test_mul
    assert_equal 20, mul(4,5)
  end
  def test_div
    assert_in_delta 5.0, div(10,2), 1e-9
    assert_raises(ZeroDivisionError) { div(1,0) }
  end
end
