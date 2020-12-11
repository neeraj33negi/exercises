class Product
  attr_accessor :name, :imported, :price, :exempted_from_tax
  def initialize(name,price,imported,exempted_from_tax)
    @name, @price, @imported, @exempted_from_tax = name, price, imported, exempted_from_tax
  end
  def sales_tax
    return 0.1 * @price unless self.exempted_from_tax?
    return 0.0
  end
  def import_duty
    return 0.05 * @price if self.imported?
    return 0.0
  end
  def exempted_from_tax?
    if @exempted_from_tax.downcase == "yes" || @exempted_from_tax.downcase == "y"
      return true
    end
    return false
  end
  def imported?
    if @imported == "yes" || @imported == "y"
      return true
    end
    return false
  end
end

products = []
loop do
  print "Name of the product: "
  name = gets.chomp
  print "Imported?: "
  imported = gets.chomp
  print "Exempted from sales tax? "
  exempted_from_tax = gets.chomp
  print "Price: "
  price = gets.chomp.to_f
  products << Product.new(name,price,imported,exempted_from_tax)
  print "Do you want to add more items to your list(y/n): "
  break if gets.chomp.downcase == 'n'
end

puts "Product\t\tPrice\tSalesTax\tImportDuty"
total_sales_tax = 0
total_import_duty = 0
total_price = 0
for product in products do
  total_price += product.price
  total_sales_tax += product.sales_tax
  total_import_duty += product.import_duty
  #puts "#{product.name}\t#{product.price}\t#{product.sales_tax}\t#{product.import_duty}"
  printf("%-10s %10.2f %10.2f %10.2f\n", product.name, product.price, product.sales_tax, product.import_duty)
end
puts "\nTotal:\t#{total_price}\t#{total_sales_tax}\t#{total_import_duty}"
puts "Grand total: #{total_price + total_import_duty + total_sales_tax}"
