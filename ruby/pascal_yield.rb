def binomial(n, r)
  if r == 0 || n == r
    return 1
  end
  if n > r
    numerator = 1
    denominator = 1
    for i in (0..r-1) do
      numerator *= n - i
      denominator *= r - i
    end
    return numerator/denominator
  end
end
def pascal(num)
  for i in (0..num-1) do
    str = ""
    for j in (0..i) do
      str << "#{binomial(i,j)} "
    end
    yield str
  end
end

pascal(8) {|x| puts x}
