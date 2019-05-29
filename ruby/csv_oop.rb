require 'csv'

class Employee
  @@designation_count = {Designer: 0, Tester: 0, Developer: 0}
  @@employees = []
  attr_accessor :name, :id, :designation
  def initialize(name:, id:, designation:)
    case designation
    when "Developer"
      @@designation_count[:Developer] += 1
    when "Designer"
      @@designation_count[:Designer] += 1
    when "Tester"
      @@designation_count[:Tester] += 1
    else
      raise ArgumentError, "Invalid designation"
    end
    @name, @id, @designation = name, id.to_i, designation
  end

  class << self
    def read_from_csv(path)
      csv_content = CSV.read(path)
      csv_content.shift
      @@employees = csv_content.map do |current_line|
        Employee.new(name:current_line[0], id:current_line[1], designation:current_line[2].strip)
      end
    end

    def write_to_file(filename)
      hash = {}
      @@employees.each do |emp|
        if @@designation_count[emp.designation.to_sym] > 1
          if hash.has_key? (emp.designation + 's')
            hash[emp.designation + 's'] << "#{emp.name} (Empid:#{emp.id})"
          else
            hash[emp.designation + 's'] = ["#{emp.name} (Empid:#{emp.id})"]
          end
        else
          if hash.has_key? (emp.designation)
            hash[emp.designation] << "#{emp.name} (Empid:#{emp.id})"
          else
            hash[emp.designation] = ["#{emp.name} (Empid:#{emp.id})"]
          end
        end
      end
      hash = hash.sort.to_h
      file = File.new(filename, "w+")
      hash.each do |key, value|
        file << (key.strip + "\n")
        value.each do |emp|
          file << (emp + "\n")
        end
      end
      file.close
    end

  end
end

Employee.read_from_csv("employees.csv")
Employee.write_to_file("aa.txt")
