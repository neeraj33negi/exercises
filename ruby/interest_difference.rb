class Interest
  attr_reader :r
  attr_accessor :p, :t
  def initialize(&b)
    instance_eval(&b)
  end
  def simple_interest_amount
    @p + (@p * @r * @t / 100.0)
  end
  def compound_interest_amount
    @p * (1.0 + @r/100.0) ** @t
  end
  def interest_difference
    self.compound_interest_amount - self.simple_interest_amount
  end
end

p = gets.chomp.to_f
t = gets.chomp.to_f
interest_obj = Interest.new do
  @r = 10.0
  @p = p
  @t = t
end
puts interest_obj.interest_difference
