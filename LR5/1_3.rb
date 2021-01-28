# frozen_string_literal: true

require 'test/unit'
require_relative './1_1'

# main test
class MyTest < Test::Unit::TestCase
  def test1_classic_test
    assert_in_delta(-1.17302, Eval.eq(1.0, 2.0, 3.0), 0.001)
  end

  def test2_returns_nil_on_div_to_zero
    assert Eval.eq(rand * 100, 0, rand * 500).nan?
  end
end

# doing the same as 1_1.rb does
class MathTest
  def self.cal(x_val, r_val, z_val)
    Math.cos(x_val + 3.1 * z_val) / Math.tan(x_val / r_val)
  end
end
