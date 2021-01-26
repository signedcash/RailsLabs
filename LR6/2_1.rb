# frozen_string_literal: true

ANS = 1.0 / 3
# Integral Class
class Integral
  include Enumerable

  attr_reader :a_limit, :b_limit

  def initialize(a_limit = 0, b_limit = 1)
    @a_limit = a_limit
    @b_limit = b_limit
  end

  def self.func(argument)
    argument * Math.sqrt(1 - argument * argument)
  end

  def sum_result(iter)
    result = (a_limit + iter).step(b_limit - iter, iter).map { |x_val| Integral.func(x_val) }.sum
    result += (Integral.func(@a_limit) + Integral.func(@b_limit)) / 2
    result * iter
  end

  def each
    iter = 10.0
    loop do
      iter /= 10
      result = sum_result(iter)
      yield result
    end
  end

  def eval(eps)
    each_with_index.find { |result, _| (result - ANS).abs < eps }
  end

  class << self
    def eval(eps)
      new.eval(eps)
    end
  end
end
