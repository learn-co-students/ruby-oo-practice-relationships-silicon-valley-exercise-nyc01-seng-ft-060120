class FundingRound

    attr_reader :startup, :venture_capitalist, :type, :investment

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        if (investment.class == Float && investment.positive?)
            @startup = startup
            @venture_capitalist = venture_capitalist
            @type = type
            @investment = investment
            @@all << self
        else
            p "Invalid Investment"
        end
    end

    def self.all
        @@all
    end

end
