def is_prime?(num)
  if num == 1
    return false
  end
  limit = num
  for i in (2..limit) do
    if num % i == 0
      return false
    else
      limit /= i
    end
    if limit == 0
      return true
    end
  end
end

def print_primes_upto_n(n)
  if n == 1
    return
  end
  primes = [1,2]
  (3..n).step(2) do |x|
    if is_prime?(x)
      primes << x
    end
  end
  print primes
  return primes
end

print_primes_upto_n(gets.chomp.to_i)

