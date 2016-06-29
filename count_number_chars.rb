# def prompt(message)
#   puts "=> #{message}"
# end

# def count_words(words)
#   words.gsub(" ", "").length
# end

# prompt("Please write word or multiple words: ")
# words = gets.chomp
# word_count = count_words(words)
# prompt("There are #{word_count} characters in \"#{words}\".")

print "Please write word or multiple words: "
input = gets.chomp
number_of_characters = input.delete(' ').size
puts "There are #{number_of_characters} characters in \"#{input}\"."
