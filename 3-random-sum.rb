puts %(The pseudocode provided in the question:
x = random_int(1,6)
y = random_int(1,6)
z = random_int(1,6)
a = x + y + z

This is 3d6 - three six sided dice - which works out to a range of 3-18.
This assumes that random_int is a stateless function that can actually return all values in the range 1-6 inclusive.

Let's build that function and make sure it works.)

def random_int(minimum, maximum)
  rand(maximum - minimum + 1) + minimum
end

result = Hash.new { |hash, key| hash[key] = 0 }

1000.times do
  result[random_int(5, 10)] += 1
end

puts "Result of 1000 rolls between 5-10 (result => count):"
pp result.sort.to_h

puts "Error! Not every number was rolled." unless result.size == 6
puts "Error! Number rolled below range: 4" unless result[4] == 0
puts "Error! Number rolled above range: 11" unless result[11] == 0

