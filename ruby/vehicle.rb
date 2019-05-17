class Vehicle
  attr_accessor :name, :price
  def initialize(name:, price:)
    @name = name
    @price = price
  end
  def to_s
    "Name:#{@name} Price:#{@price}"
  end
end

class Bike < Vehicle
  attr_accessor :dealer, :percent_price_increase
  def initialize(name:, price:, dealer:, percent_price_increase:)
    super(name: name, price: price)
    @dealer = dealer
    @percent_price_increase = percent_price_increase
  end
  def price_increase
    @price = @price.to_f * (1.0 + @percent_price_increase.to_f/100)
  end
  def to_s
    return "Bike Name: #{@name}\nBike Price: #{@price}\nBike Dealer: #{@dealer}"
  end
end

class String
  def is_i?
   /\A[-+]?\d+\z/ === self
 end
end

def utility_function_to_get_specific_data(idx, arr)
  str = ""
  for i in (idx..arr.length - 1) do
    if arr[i].is_i?
      numeric_value = arr[i]
      break
    else
      if str.length == 0
        str << arr[i]
      else
        str << " " + arr[i]
      end
    end
  end
  return str, numeric_value, i + 1
end
inp = gets.chomp
inp =  inp.scan(/\d+|[a-zA-Z]+/)

name, price, next_idx = utility_function_to_get_specific_data(0, inp)
dealer, percent_price_increase = utility_function_to_get_specific_data(next_idx, inp)

bike = Bike.new(name: name, price: price.to_i, dealer: dealer, percent_price_increase: percent_price_increase)
puts bike
puts "\nAfter #{bike.percent_price_increase} percent hike in price:"
bike.price_increase
puts bike














