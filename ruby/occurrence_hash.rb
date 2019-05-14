class OccurrenceHash
  attr_accessor :string
  def initialize arg
    @string = arg.join('')
  end
  def count_occurrences
    hash = Hash.new(0)
    for i in 0..@string.length
      if /[a-zA-Z]/.match(@string[i])
          hash[@string[i]] = hash[@string[i]] + 1
      end
    end
    hash

  end
end

str = OccurrenceHash.new ARGV
puts str.count_occurrences
