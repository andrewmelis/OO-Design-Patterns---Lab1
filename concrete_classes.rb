#first try at account, portfolio    //components
#and stock, moneymarket, and bond   //leaves
require "./abstract_classes.rb"


#portfolios made of accounts and other portfolios
class Portfolio < Composite

end

#accounts made of stocks, moneymarkets, and bonds
class Account < Composite

end

##########################


class Stock < Security
  def initialize(name, value)
    super(name)
    @current_value = value
  end
end


class MoneyMarket < Security
  def initialize(name, value)
    super(name)
    @current_value = value
  end
end

class Bond < Security
  def initialize(name, value)
    super(name)
    @current_value = value
  end
end

##########################

class Visitor
  #need this method because duck typing
  #doesn't allow me to input specific types
  def visit obj		
    if obj.is_a? Stock
      visitStock obj
    elsif obj.is_a? MoneyMarket
      visitMM obj
    elsif obj.is_a? Bond
      visitBond obj
    elsif obj.is_a? Account
      visitAccount obj
    elsif obj.is_a? Portfolio
      visitPortfolio obj
    end
  end

  def visitStock stock
    #stock goes up by 10%
    stock.current_value *=2
  end

  def visitMM mm
    #mm goes down by 15%
    mm.current_value *=0.85
  end

  def visitBond bond
    #bond goes up by 50%
    bond.current_value *=1.5
  end

  def visitAccount acct
    acct.current_value = 0
    acct.sub_components.each do |s|
      s.accept self 
      acct.current_value += s.current_value
    end
  end

  def visitPortfolio portfolio
    portfolio.current_value = 0
    portfolio.sub_components.each do |s|
      s.accept self
      portfolio.current_value += s.current_value
    end
  end
  
end

###############################


#this is unnecessary due to ruby enumberable mixin
#however, this is what an external iterator would look like
#
#its key advantage over an internal iterator 
#is the capability to "pause" at a given
#element of a collection using the curItem method
#
#However, the assignment does not ask for an interface
#to statically view (and alter) the contents of a given portfolio,
#ie, as someone might at an ATM,
#so there appears to be no reason to actually implement this iterator
class PortfolioIterator
  def initialize portfolio
    @portfolio = portfolio.sub_components
    @index = 0;
  end

  def first
    @portfolio[0]
  end

  def next
    value = @portfolio[@index]
    @index +=1
    value
  end

  def curItem
    @portfolio[@index]
  end

  def isDone?
    @index < @portfolio.length
  end

end
