module Enumerable
  # Your code goes here
  def my_each
    i = 0
    until i == self.length do
      yield(self[i])
      i += 1
    end

    return self
  end

  def my_each_with_index
    i = 0
    until i == self.length do
      yield(self[i], i)
      i += 1
    end

    self
  end

  def my_all?
    self.my_each do |elem|
    return false if yield(elem) == false
    end

    true
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem) == true
    end

    false
  end

  def my_count
    if block_given?
      sum = 0

      self.my_each do |elem|
        sum +=1 if yield(elem)
      end
      
      return sum
    end

    self.reduce(0) { |sum| sum += 1 }  
  end
  def my_inject(initial_value = nil)
    accumulator = initial_value

    self.my_each_with_index do |elem, index|
      next accumulator = elem if index == 0 && accumulator == nil

      accumulator = yield(accumulator, elem)
    end
    accumulator
  end

  def my_map
    new_array = []
    self.my_each do |elem|
      new_array.push(yield(elem))
      
    end
    new_array
  end

  def my_none?
    self.my_each do |elem|
      return false if yield(elem)
    end

    return true
  end

  def my_select
    new_array = []
    self.my_each do |elem|
      new_array.push(elem) if yield(elem)
    end
    new_array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  array = [1, 1, 2, 3, 5, 8, 13, 21, 34]

  array.my_each { |elem| elem}  

  array.my_all? { |value| value < 5 }

  array.my_any? { |elem| elem == 34 }

  array.my_count {|elem| elem > 5}

  # array.my_each_with_index { |elem, index| puts "The element is #{elem} and the index #{index}" }

  array.my_inject(4) { |accumulator, elem| accumulator + elem }

  array.my_map { |elem| elem * 2 }

   array.my_none? { |elem| elem < 0 }

  p array.my_select { |elem| elem > 1 }
end
