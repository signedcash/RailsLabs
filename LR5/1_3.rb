# frozen_string_literal: true

require 'test/unit'
require_relative './1_1'

# main test
class MyTest < Test::Unit::TestCase
  def test1_for_x_val
    (1..10).each { |x_val| assert_equal(MathTest.cal(x_val, 1, 1), Eval.eq(x_val, 1, 1)) }
  end

  def test2_for_r_val
    (1..10).each { |r_val| assert_equal(MathTest.cal(1, r_val, 1), Eval.eq(1, r_val, 1)) }
  end

  def test3_for_z_val
    (1..10).each { |z_val| assert_equal(MathTest.cal(1, 1, z_val), Eval.eq(1, 1, z_val)) }
  end
end

# doing the same as 1_1.rb does
class MathTest
  def self.cal(x_val, r_val, z_val)
    Math.cos(x_val + 3.1 * z_val) / Math.tan(x_val / r_val)
  end
end
