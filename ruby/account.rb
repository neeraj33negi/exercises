require 'thread'
class Account
  @@account_no = 0
  attr_accessor :name, :balance, :account_no
  def initialize(name:, balance:)
    @name = name
    @balance = balance
    @@account_no += 1
    @account_no = @@account_no
  end
  def deposit amount
    @balance += amount
  end
  def withdraw amount
    exit if @balance - amount < 0
    @balance -= amount
  end
end

input = gets.chomp.split

user1 = Account.new(name: input[0].split(":")[0], balance: input[0].split(":")[1].to_i)
user2 = Account.new(name: input[1].split(":")[0], balance: input[1].split(":")[1].to_i)
transfer_amount = input[2].split(":")[1].to_i

mtx = Mutex.new
mtx.synchronize do
  user1.withdraw transfer_amount
  user2.deposit transfer_amount
  puts "Account number: #{user1.account_no}"
  puts "Account holder name: #{user1.name}"
  puts "Account balance: #{user1.balance}"
  puts "Account number: #{user2.account_no}"
  puts "Account holder name: #{user2.name}"
  puts "Account balance: #{user2.balance}"
end
