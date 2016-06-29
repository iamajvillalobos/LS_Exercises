def running_total(numbers)
  # running_total = []
  # numbers.each do |num|
  #   if running_total.size == 0 
  #     running_total << num
  #   else
  #     running_total << num + running_total.last
  #   end
  # end
  # running_total

  sum = 0
  numbers.map { |num| sum + num }
end


p running_total([2, 5, 13]) #== [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) #== [14, 25, 32, 47, 67]
p running_total([3]) #== [3]
p running_total([]) #== []
