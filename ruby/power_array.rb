class Array
  def power(x)
    self.map { |e| e**x }
  end
end
*array, power = ARGV[0].scan(/[-]?\d+|[a-zA-Z]+/)
array = array.map { |e| e.to_i }
puts array.inspect
puts array.power(power.to_i).inspect
