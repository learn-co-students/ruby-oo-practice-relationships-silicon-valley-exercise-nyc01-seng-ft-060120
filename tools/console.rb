require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup_one = Startup.new("Startup One", "Max", "Social Media")
startup_two = Startup.new("Startup Two", "Amanda", "Education")
startup_three = Startup.new("Startup Three", "Samantha", "Healthcare")
Startup.all
startup_one.pivot("Startup One V2", "CMS")
Startup.find_by_founder("Amanda")
Startup.domains

vc_one = VentureCapitalist.new("Jeff", 2000000000)
vc_two = VentureCapitalist.new("Jennifer", 134000000000)
vc_three = VentureCapitalist.new("Griffin", 2500000)
VentureCapitalist.all
VentureCapitalist.tres_commas_club

startup_one.sign_contract(vc_one, "Angel", 100000.00)
startup_one.sign_contract(vc_three, "Angel", 200000.00)
startup_two.sign_contract(vc_two, "Pre-Seed", 550000.00)
startup_three.sign_contract(vc_one, "Series A", 1250000.00)

startup_one.num_funding_rounds
startup_one.total_funds
startup_one.investors
startup_one.big_investors

vc_two.offer_contract(startup_two, "Pre-Seed", 150000.00)
vc_two.funding_rounds
vc_two.portfolio
vc_two.biggest_investment
vc_two.invested("Education")

binding.pry
0 #leave this here to ensure binding.pry isn't the last line