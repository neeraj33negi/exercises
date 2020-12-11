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

  def hash_inject(data)
    hash = {"even" => [], "odd" => []}
    data.each do |key, val|
      if key & 1 == 1
        hash["odd"] << val
      else
        hash["even"] << val
      end
    end
    hash
  end

end

arr = ARGV[0].gsub(/[\[\]"']/,"").split(',')
puts arr.hash_inject(arr.to_hash)
