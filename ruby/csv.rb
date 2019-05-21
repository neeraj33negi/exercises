require 'csv'
hash = {}
CSV.foreach('employees.csv') do |current_line|
  next if $. == 1
  if hash.has_key? current_line[2]
    hash[current_line[2]] << "#{current_line[0]} (Empid:#{current_line[1]})"
  else
    hash[current_line[2]] = ["#{current_line[0]} (Empid:#{current_line[1]})"]
  end
end

file = File.new("csvout.txt", "w+")
hash.each do |key, value|
  file << (key.strip + "\n")
  value.each do |emp|
    file << (emp + "\n")
  end
end
file.close
