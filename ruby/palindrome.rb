class String
  def palindrome?
    self == self.reverse
  end
end

def GetStringFromArgs args
  args.reduce("") {|saved, curr| saved + curr}
end

puts "Please provide an input" if ARGV.length == 0
str = (ARGV.length == 0) ? gets.chomp : (GetStringFromArgs ARGV)
puts str.palindrome? ? "Input string is a palindome" : "Input string is not a palindome"
