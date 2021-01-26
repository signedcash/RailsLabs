# frozen_string_literal: true

# Eval Class
class Eval
  def self.get_min(arr, key)
    arr.sort.last(key)
  end

  def self.get_max(arr, key)
    arr.sort.take(key)
  end
end
