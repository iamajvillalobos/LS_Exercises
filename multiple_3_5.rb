def multisum(num)
  (1..num).select { |i| i % 3 == 0 || i % 5 == 0 }.inject(&:+)
end

puts multisum(3) #== 3
p multisum(5) #== 8
puts multisum(10) #== 33
puts multisum(1000) #== 234168
