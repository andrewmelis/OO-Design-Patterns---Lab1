require './concrete_classes'
require 'singleton'

class PortfolioManager 
  #include Singleton

  attr_accessor :portfolios
  def initialize
    @portfolios = Array.new
  end

  def buildPortfolio_1
    mm = MoneyMarket.new("mm",100)
    bond = Bond.new("bond",50)
    stock = Stock.new("stock",150)
    account = Account.new("account")
    account2 = Account.new("account2")
    portfolio1 = Portfolio.new("port1")
    portfolio2 = Portfolio.new("port2")
    
    account<<(bond)
    account<<(mm)
    account2<<(stock)
    portfolio2<<account2
    portfolio1<<(portfolio2)
    portfolio1<<(account)

    @portfolios<<(portfolio1)
  end
  
  def buildPortfolio_2
    mm = MoneyMarket.new("mm",25)
    bond = Bond.new("bond",400)
    bond2 = Bond.new("bond2",30)
    stock = Stock.new("stock",100)
    stock2 = Stock.new("stock2",29)
    account2 = Account.new("account2")
    account = Account.new("account")
    portfolio1 = Portfolio.new("port1")
    portfolio2 = Portfolio.new("port2")
    
    account<<(bond)
    account<<(mm)
    account<<(stock)
    account2<<(stock2)
    account2<<(bond2)
    portfolio2<<(account2)
    portfolio1<<(portfolio2)
    portfolio1<<(account)
  
    @portfolios << portfolio1
  end

  def printPortfolio portfolio
    puts portfolio.name + " has value of $"+portfolio.current_value.to_s
    puts "sub_components: \n"
    portfolio.sub_components.each do |sc|
      if sc.is_a? Portfolio
	printPortfolio sc
      else
	printAccount sc
      end
    end
  end

  def printAccount account
    puts account.name + " has value of $"+account.current_value.to_s
    puts "sub_components: \n"
    account.sub_components.each do |sc|
      puts "#{sc.name} | $#{sc.current_value}"
    end
  end

end

####################################
#NOW TESTING
#pm = PortfolioManager.instance
puts "\n"
pm = PortfolioManager.new
v = Visitor.new

pm.buildPortfolio_1
pm.buildPortfolio_2

pm.portfolios.each do |p|
  p.accept v

  pm.printPortfolio p
  puts "\n"
end
