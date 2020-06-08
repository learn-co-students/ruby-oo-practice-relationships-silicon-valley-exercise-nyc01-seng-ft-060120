class Startup

    attr_reader :name, :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(name, domain)
        @name = name
        @domain = domain
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.count{|funding_round| funding_round.startup == self}
    end

    def investments
        FundingRound.all.select{|funding_round| funding_round.startup == self}
    end

    def total_funds
        self.investments.sum{|funding_round| funding_round.investment}
    end

    def investors
        self.investments.map{|investment| investment.venture_capitalist}.uniq
    end

    def big_investors
        VentureCapitalist.tres_commas_club.select{|investor| self.investors.include?(investor)}
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        @@all.find{|startup| startup.founder == founder}
    end

    def self.domains
        @@all.map{|startup| startup.domain}.uniq
    end

end
