def foobars
  1.upto(100) { |n| puts foobar(n) }
end

def foobar(n)
  # In Rails, we can use .presence:
  # "#{'Foo' if n % 3 == 0}#{'Bar' if n % 5 == 0}".presence || n

  # We don't have .presence here, so:
  result = "#{'Foo' if n % 3 == 0}#{'Bar' if n % 5 == 0}"
  result.empty? ? n : result
end	

puts("Foobar of 3 is #{foobar(3)}, should be 'Foo'")
puts("Foobar of 5 is #{foobar(5)}, should be 'Bar'")
puts("Foobar of 15 is #{foobar(15)}, should be 'FooBar'")
puts("Foobar of 1 is #{foobar(1)}, should be 1")
puts("Foobars (1-100) are: (press enter to continue)")
gets.chomp
foobars