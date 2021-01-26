# frozen_string_literal: true

ANS = 1.0 / 3
# Integral Class
class Integral
  attr_reader :eps, :a_limit, :b_limit

  def initialize(eps)
    @a_limit = 0
    @b_limit = 1
    @eps = eps
  end

  def self.func(argument)
    argument * Math.sqrt(1 - argument * argument)
  end

  def sum_result(iter)
    result = 0
    (@a_limit + iter).step(@b_limit - iter, iter) { |x_val| result += Integral.func(x_val) }
    result += (Integral.func(@a_limit) + Integral.func(@b_limit)) / 2
    result * iter
  end

  def eval
    iter = 10.0
    result = 0
    while (result - ANS).abs > @eps
      iter /= 10
      result = sum_result(iter)
    end
    result
  end
end
