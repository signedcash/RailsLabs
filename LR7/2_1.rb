# frozen_string_literal: true

# Person Class
class Person
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def print_person
    puts "Last name: #{name}"
    puts "Age: #{age}"
  end
end

# Sick Person Class
class Sick < Person
  attr_reader :last_visit

  def initialize(name, age, last_visit)
    super(name, age)
    @last_visit = last_visit
  end

  def next_visit
    puts "Year of the next medical examination: #{@last_visit + 3}"
  end
end
