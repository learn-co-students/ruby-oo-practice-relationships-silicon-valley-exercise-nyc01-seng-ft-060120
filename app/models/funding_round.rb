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
