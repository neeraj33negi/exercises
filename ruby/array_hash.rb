class Array
  def to_hash
    hash = {}
    self.each do |variable|
      if hash.has_key?(variable.to_s.length)
        hash[variable.to_s.length] << variable
      else
        hash[variable.to_s.length] = [variable.gsub(/["'\[\]]/, "")]
      end
    end
    hash.sort.to_h
  end

end

arr = ARGV[0].gsub(/[\[\]"']/,"").split(',')
puts arr.to_hash
