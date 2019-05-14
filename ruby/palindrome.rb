class String
  def palindrome?
    self == self.reverse
  end
end

def get_string_from_args args
  args.join('')
end

puts 'Please provide an input' if ARGV.length == 0
str = (ARGV.length == 0) ? gets.chomp : (get_string_from_args ARGV)
puts str.palindrome? ? 'Input string is a palindome' : 'Input string is not a palindome'
