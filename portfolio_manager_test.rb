#test class for Lab Deliverable 1
require "./concrete_classes.rb"	  #don't need abstract classes since concrete_classes requires it

mm = MoneyMarket.new("mm")
bond = Bond.new("bond")
stock = Stock.new("stock")
account = Account.new("account")
portfolio = Portfolio.new("port1")
portfolio2 = Portfolio.new("port2")

account<<(bond)
account<<(mm)
account<<(stock)
portfolio<<(portfolio2)
portfolio<<(account)

puts portfolio.name
portfolio.sub_components.each do |sc|
  puts "\t#{sc.name} | $#{sc.current_value}"
  sc.sub_components.each do |scsc|
    puts "\t\t#{scsc.name} | $#{scsc.current_value}"	#if scsc.parent==nil print one tab, 2 otherwise?
  end
end

account.remove(mm)

puts portfolio.name
portfolio.sub_components.each do |sc|
  puts "\t#{sc.name} | $#{sc.current_value}"
  sc.sub_components.each do |scsc|
    puts "\t\t#{scsc.name} | $#{scsc.current_value}"	#if scsc.parent==nil print one tab, 2 otherwise?
  end
end


