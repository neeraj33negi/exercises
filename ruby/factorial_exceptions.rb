def factorial(n)
  raise ArgumentError, 'Negative number entered' if n < 0
  return (1..n).to_a.reduce(1) { |fact,curr| fact * curr}
end
begin
  num = gets.chomp.to_i
  puts factorial(num)
rescue => e
  puts e
end
