puts "Please provide an input: "
text = gets.chomp
vowel_replaced_text = text.gsub(/[aeiouAEIOU]/, "*")
puts vowel_replaced_text
