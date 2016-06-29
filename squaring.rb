def multiply(num1, num2)
  num1 * num2
end

def square(num1)
  multiply(num1, num1)
end

def power_to_the(num, power)
  num ** power
end

puts square(5)
puts square(-8)

puts power_to_the(5, 4)
