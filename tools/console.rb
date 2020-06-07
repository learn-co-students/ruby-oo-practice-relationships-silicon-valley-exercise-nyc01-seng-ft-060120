require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

vc1 = VentureCapitalist.new("kiki", 244433453523)
vc2 = VentureCapitalist.new("doug", 234234)
vc3 = VentureCapitalist.new("tala", 10000000000)

startup1 = Startup.new("Cat Sweaters", "Meredith Witherspoon", "clothes for cats")
startup2 = Startup.new("PetConnect", "Tammy Rosewater", "matchmaking app for pets")
startup3 = Startup.new("EcoPiña", "Vivienne Tableau", "Phone cases made from pineapple skin")

funding_round1 = FundingRound.new(startup1, vc1, "PRE-SEED", 12312312)
funding_round2 = FundingRound.new(startup1, vc2, "PRE-SEED", 4444)
funding_round3 = FundingRound.new(startup1, vc3, "PRE-SEED", 234234)
funding_round3 = FundingRound.new(startup1, vc3, "PRE-SEED", 3333234234234234)

Pry.start
0#leave this here to ensure binding.pry isn't the la