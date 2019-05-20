def character_count_ranges(str)
  lowercase = 0
  uppercase = 0
  special = 0
  numeric = 0
  for i in (0..str.length - 1) do
    char = str[i]
    if char =~ /[[:alpha:]]/
      lowercase += 1 if ('a'..'z').include? char
      uppercase += 1 if ('A'..'Z').include? char
    elsif char =~ /[[:digit:]]/
      numeric += 1
    else
      special += 1
    end
  end
  puts "Lowecase characters: #{lowercase}"
  puts "Uppercase characters: #{uppercase}"
  puts "Numeric characters: #{numeric}"
  puts "Special characters: #{special}"
end

character_count_ranges("my PASSw@rd i$ 123")
