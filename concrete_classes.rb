#first try at account, portfolio    //components
#and stock, moneymarket, and bond   //leaves
require "./abstract_classes.rb"


#portfolios made of accounts and other portfolios
class Portfolio < Composite

  def current_value
    #recursive stuff with visitor and iterator
  end

end

#accounts made of stocks, moneymarkets, and bonds
class Account < Composite

  def current_value
    #recursive stuff with visitor and iterator
  end

end

##########################


class Stock < Security

  def current_value
    value = 100
  end

end

class MoneyMarket < Security

  def current_value
    value = 50
  end

end

class Bond < Security

  def current_value
    value = 150
  end

end

