####################################
require './portfolio_manager'

puts "NOW TESTING\n"
pm = PortfolioManager.instance
v = Visitor.new

pm.buildPortfolio_1
pm.buildPortfolio_2

pm.portfolios.each do |p|
  p.accept v
  p.printPortfolio 
  puts "\n"
end
