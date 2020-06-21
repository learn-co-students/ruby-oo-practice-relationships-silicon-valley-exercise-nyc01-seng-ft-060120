require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

class FundingRound
 
  attr_reader :venture_capitalists, :startup, :type, :investment

  @@all = []

  def initialize (venture_capitalist, startup, type, investment)
    @venture_capitalist = venture_capitalist
    @startup = startup
    @type = type
    @investment = investment
    @@all << self
  end

  def self.all
    @@all
  end

end

klarna = Startup.new("klarna","klarna.com","Sebas")
n26 = Startup.new("n26","n26.com","valentin")

rich = VentureCapitalist.new("rich guy",1000000000)
poor = VentureCapitalist.new("poor guy",100000)

round1 = FundingRound.new("Angel", 100)
round2 = FundingRound.new("mom", 30000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
