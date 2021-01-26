# frozen_string_literal: true

require 'test/unit'
require_relative './3_1'

ANS1 = 1.12538608308327
ANS2 = 0.6666666666666667

# main test
class MyTest < Test::Unit::TestCase
  # :reek:FeatureEnvy
  def test1_lambda
    assert_in_delta(ANS1, EvalClass.eval(0, 1, 1000, &->(x_val) { Math.exp(x_val) / (x_val + 1) }), 0.1)
    assert_in_delta(ANS2, EvalClass.eval(0, 2, 1000, &->(x_val) { x_val * (x_val - 1) }), 0.1)
  end

  # :reek:FeatureEnvy
  def test2_block
    assert_in_delta(ANS1, EvalClass.eval(0, 1, 1000) { |x_val| Math.exp(x_val) / (x_val + 1) }, 0.1)
    assert_in_delta(ANS2, EvalClass.eval(0, 2, 1000) { |x_val| x_val * (x_val - 1) }, 0.1)
  end
end
