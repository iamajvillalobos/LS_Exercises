# def xor?(num1, num2)
#   if num1 == true && num2 == true
#     return false
#   elsif num1 == true && num2 == false
#     return true
#   elsif num1 == false && num2 == true
#     return true
#   else
#     return false
#   end
# end

def xor?(num1, num2)
  return true if num1 && !num2
  return true if !num1 && num2
  false
end

puts xor?(5.even?, 4.even?) # true
puts xor?(5.odd?, 4.odd?) # true
puts xor?(5.odd?, 4.even?) # false
puts xor?(5.even?, 4.odd?) # false
