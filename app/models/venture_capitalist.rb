class VentureCapitalist

    attr_accessor :total_worth
    attr_reader :name

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select{|funding_round| funding_round.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map{|investment| investment.startup}.uniq
    end

    def biggest_investment
        self.funding_rounds.max{|investment_a, investment_b| investment_a.investment <=> investment_b.investment}
    end

    def invested(domain)
        self.funding_rounds.select{|funding_round| funding_round.startup.domain == domain}.sum{|funding_round| funding_round.investment}
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select{|vc| vc.total_worth >= 1000000000}
    end

end
