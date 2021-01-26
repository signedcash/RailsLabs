# frozen_string_literal: true

require 'test/unit'
require_relative './2_1'

# test class
class MyTest < Test::Unit::TestCase
  def test1_min
    len = rand(2..1001)
    key = rand(1000) % (len / 2) + 1
    arr = Array.new(len) { rand(-10_000..9999) }
    assert_equal(Eval.get_min(arr, key), MyTest.get_min(arr, key))
  end

  def test2_max
    len = rand(2..1001)
    key = rand(1000) % (len / 2) + 1
    arr = Array.new(len) { rand(-10_000..9999) }
    assert_equal(Eval.get_max(arr, key), MyTest.get_max(arr, key))
  end
end

# MyTest Class
class MyTest
  def self.get_min(arr, key)
    arr.sort.last(key)
  end

  def self.get_max(arr, key)
    arr.sort.take(key)
  end
end
