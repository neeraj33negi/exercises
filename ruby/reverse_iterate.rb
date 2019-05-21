class Array
  def reverse_iterate
    for i in (self.length - 1).downto(0)
      yield self[i]
    end
  end
end

[1,2,3,4,5].reverse_iterate {|i| print "#{i} "}
