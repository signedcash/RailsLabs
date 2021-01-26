# frozen_string_literal: true

# Class Eval
class EvalClass
  def self.eval(a_limit, b_limit, dif, &block)
    iter = (b_limit - a_limit).to_f / dif
    a_limit.step(b_limit, iter).map(&block).sum * iter
  end
end
