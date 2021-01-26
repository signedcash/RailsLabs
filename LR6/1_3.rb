# frozen_string_literal: true

require 'test/unit'
require_relative './1_1'

# main test
class MyTest < Test::Unit::TestCase
  def test1_delta
    [0.001, 0.0001].each { |eps| assert_in_delta(ANS, Integral.new(eps).eval, eps) }
  end
end
