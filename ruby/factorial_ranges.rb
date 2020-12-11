def factorial_using_ranges(num)
  return 1 if num <= 1
  fact = 1
  (1..num).step(1) do |n|
    fact *= n
  end
  return fact
end

puts factorial_using_ranges(ARGV[0].to_i)
