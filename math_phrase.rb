NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times divided)

def mathphrase(number_of_operations)
  operations = [NUMBERS.sample]
  number_of_operations.times do
    operations << OPERATORS.sample
    operations << NUMBERS.sample
  end
  operations.join(' ').gsub("divided", "divided by")
end

10.times do
  length = (1..20).to_a.sample
  p mathphrase(length)
end
