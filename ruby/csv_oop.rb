require 'csv'

class Employee
  attr_accessor :name, :id, :designation
  def initialize(name:, id:)
    @name, @id = name, id.to_i
  end
end

class Developer < Employee
  def initialize(name:, id:)
    super
    @designation = "Developer"
  end
end

class Designer < Employee
  def initialize(name:, id:)
    super
    @designation = "Designer"
  end
end

class Tester < Employee
  def initialize(name:, id:)
    super
    @designation = "Tester"
  end
end

class Solution
  def initialize
    @employees = []
  end

  def read_csv_in_hash(path)
    hash = Hash.new
    csv_content = CSV.read(path)
    csv_content.shift
    csv_content.each do |emp|
      case emp[2].strip
      when "Tester"
        @employees << Tester.new(name:emp[0], id:emp[1])
        designation = "Tester"
      when "Developer"
        @employees << Developer.new(name:emp[0], id:emp[1])
        designation = "Developer"
      when "Designer"
        @employees << Designer.new(name:emp[0], id:emp[1])
        designation = "Designer"
      end
    end
    @employees.each do |emp|
      if hash.has_key? (emp.class.to_s)
        hash[emp.class.to_s] << "#{emp.name} (Empid:#{emp.id})"
      else
        hash[emp.class.to_s] = ["#{emp.name} (Empid:#{emp.id})"]
      end
    end
    hash["Testers"] = hash.delete("Tester") if hash["Tester"].length > 1
    hash["Developers"] = hash.delete("Developer") if hash["Developer"].length > 1
    hash["Designers"] = hash.delete("Designer") if hash["Designer"].length > 1
    hash.sort.to_h
  end

  def write_hash_to_file(filename, hash)
    file = File.new(filename, "w+")
    hash.each do |key, value|
      file << (key.strip + "\n")
      value.each do |emp|
        file << (emp + "\n")
      end
    end
    file.close
  end

  def csv_to_plain_file(source_csv, target_file)
    self.write_hash_to_file(target_file, read_csv_in_hash(source_csv) )
  end

end

Solution.new.csv_to_plain_file("employees.csv", "solve.txt")
