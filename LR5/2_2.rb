# frozen_string_literal: true

require_relative './2_1'
str = gets.to_s
arr = str.split(' ').map(&:to_i)
k = gets.to_i
if k > arr.count / 2 || k <= 0 || str == "\n"
  puts 'Input error'
  exit
end
arr_min = Eval.get_min(arr, k)
arr_max = Eval.get_max(arr, k)
puts("K max: #{arr_max.inspect}")
puts("K min: #{arr_min.inspect}")
