class OccurrenceHash
  attr_accessor :string
  def initialize arg
    @string = arg.reduce("") {|initial, curr| initial + curr}
  end
  def count_occurrences
    hash = {}
    for i in 0..@string.length
      if /[a-zA-Z]/.match(@string[i])
        unless hash.has_key? (@string[i])
          hash[@string[i]] = 1
        else
          hash[@string[i]] = hash[@string[i]] + 1
        end
      end
    end
    hash
  end
end

str = OccurrenceHash.new ARGV
puts str.count_occurrences
