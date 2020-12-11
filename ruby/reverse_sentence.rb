class String
  def reverse_sentence
    self.split(" ").reverse.join(' ')
  end
end

puts "away doctor the keeps day a apple An".reverse_sentence
puts "Hello everyone! Good morning".reverse_sentence
