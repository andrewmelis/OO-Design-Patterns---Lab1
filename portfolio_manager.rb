require './concrete_classes'
require 'singleton'

class PortfolioManager 
  include Singleton

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
  
end


