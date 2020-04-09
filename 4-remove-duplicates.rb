# Many ways to solve this, let's try to minimize runtime.
# Iterate through words, incrementing a hash value for each word.
# Then return the keys in the hash.
# Runtime: n * (iteration + lookup + increment + get key) = 4n, linear time
def remove_duplicates(words)
  unique_words = Hash.new { |hash, key| hash[key] = 0 }
  words.each do |word|
  	unique_words[word] += 1
  end
  unique_words.keys
end

tests = [
  [],
  ['foo', 'foo'],
  ['foo'],
  ['foo', 'bar', 'baz', 'foo', 'bar', 'baz'],
  ['one', 'one', 'two', 'three', 'three', 'two']
]

tests.each do |test|
  puts "Removing duplicates from #{test}: #{remove_duplicates(test)}"
end