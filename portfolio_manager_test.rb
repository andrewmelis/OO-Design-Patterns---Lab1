#test class for Lab Deliverable 1
require "./concrete_classes.rb"	  #don't need abstract classes since concrete_classes requires it

mm = MoneyMarket.new("mm",100)
puts mm.name
puts mm.current_value
bond = Bond.new("bond",100)
stock = Stock.new("stock",100)
account = Account.new("account")
portfolio = Portfolio.new("port1")
#portfolio2 = Portfolio.new("port2")
v = Visitor.new
#
account<<(bond)
account<<(mm)
account<<(stock)
#portfolio<<(portfolio2)
portfolio<<(account)
#
#stock.accept(v)
#puts "after visitor: #{stock.current_value}"
#bond.accept v
#puts "after visitor: #{bond.current_value}"
#mm.accept v
#puts "after visitor: #{mm.current_value}"
#account.accept v

portfolio.accept v
puts "portfolio visitor: #{portfolio.current_value}"
puts "account visitor: #{account.current_value}"
