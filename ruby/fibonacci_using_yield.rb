number = gets.chomp.to_i
def fibo number
  last = 1
  second_last = 0
  curr = 1
  while curr <= number
    yield curr
    curr = last + second_last
    second_last = last
    last = curr
  end
end

fibo (number) {|x| print "#{x} "}
