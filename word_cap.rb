def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven')
p word_cap('the javascript language')
p word_cap('this is a "quoted" word')
