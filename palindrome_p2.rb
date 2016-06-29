# def real_palindrome?(word)
#   simplify(word) == simplify(word).reverse
# end

# def simplify(word)
#   word.downcase.gsub(/[\W]/, '')
# end

def real_palindrome?(word)
  word.downcase.delete('^a-z0-9') == word.downcase.delete('^a-z0-9').reverse
end

puts real_palindrome?('madam') #== true
puts real_palindrome?('Madam') #== true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") #== true # (only alphanumerics matter)
puts real_palindrome?('356653') #== true
puts real_palindrome?('356a653') #== true
puts real_palindrome?('123ab321') #== false
