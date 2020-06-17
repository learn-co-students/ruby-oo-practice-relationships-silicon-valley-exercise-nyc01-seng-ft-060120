class FundingRound

    attr_accessor :startup, :venture_capitalist, :type, :investesment

    @@all = []

    def initialize(startup, venture_capitalist, type, investesment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment
        @@all << self
    end 

    def self.all
        @@all
    end


end
