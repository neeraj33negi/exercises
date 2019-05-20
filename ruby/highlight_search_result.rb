def highlight_search_result(str, key)
  puts str.gsub(/(#{key})/i, '(\1)')
  puts "Total Occurences found:" + str.scan(/#{key}/i).count.to_s
end

str = gets.chomp
key = gets.chomp
highlight_search_result(str,key)
