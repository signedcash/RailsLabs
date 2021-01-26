# frozen_string_literal: true

require_relative './1_1'
puts 'Enter the accuracy:'
eps = gets.to_f
puts Integral.new(eps).eval
