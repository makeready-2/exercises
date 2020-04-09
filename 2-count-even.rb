def even_numbers_up_to(n)
  (n / 2) + 1
end


puts("even_numbers_up_to 0 is #{even_numbers_up_to(0)}, should be 1")
puts("even_numbers_up_to 1 is #{even_numbers_up_to(1)}, should be 1")
puts("even_numbers_up_to 2 is #{even_numbers_up_to(2)}, should be 2")
puts("even_numbers_up_to 3 is #{even_numbers_up_to(3)}, should be 2")
puts("even_numbers_up_to 100 is #{even_numbers_up_to(100)}, should be 51")