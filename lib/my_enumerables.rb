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
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  array = [1, 2, 3]

  array.my_each { |elem| puts elem}
end
