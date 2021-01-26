# frozen_string_literal: true

require 'test/unit'
require_relative './2_1'

# main test
class MyTest < Test::Unit::TestCase
  def test1_delta
    [0.01, 0.001].each do |eps|
      assert_in_delta(ANS, Integral.eval(eps).first, eps)
    end
  end
end
