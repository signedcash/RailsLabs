# frozen_string_literal: true

require_relative './2_1'

puts 'Enter last name: '
l_name = gets
puts 'Enter age'
age = gets.to_i
p = Person.new(l_name, age)
p.print_person

s = Sick.new(l_name, age, rand(2018..2020))
s.print_person
s.next_visit
