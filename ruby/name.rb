class NameError < StandardError
  def initialize(msg = "Wrong name input")
    super
  end
end
class Name
  attr_accessor :firstname, :lastname, :rest
  def initialize(name)
    raise NameError.new 'Lastname cannot be blank' if name.split.length < 2
    fname, lname, *rest = name.split
    raise NameError.new 'Firstname must start with uppercase letter' unless fname[0] == fname[0].upcase
    @firstname, @lastname, @rest = fname, lname, rest

  end
end

name = gets.chomp
begin
  obj = Name.new(name)
  puts "Your name is #{obj.firstname} #{obj.lastname}"
rescue => e
  puts e
end
