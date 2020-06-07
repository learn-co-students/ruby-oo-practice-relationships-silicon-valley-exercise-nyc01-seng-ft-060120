class VentureCapitalist

    attr_reader :name, :total_worth 

    @@all = []

    def initialize (name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select do |venture_capitalist|
            venture_capitalist.total_worth >= 1000000000
        end
    end

    def offer_contract (startup, type, amount, venture_capitalist)
        FundingRound.new (startup, type, amount, self)
    end

    def funding_rounds
        FundingRound.all.select do |round| 
            round.venture_capitalist == self
        end
    end
    
    def portfolio
        funding_rounds.map do |round| 
            round.startup.domain.uniq
        end    
    end

    def bigest_investment
        funding_rounds.max do |a, b| 
            a.investment <=> b.investment
        end
    end

    def invested(domain)
        domain_array = funding_rounds.select do |round| 
            round.startup.domain == domain
        end
            total_amt_invested = 0
        domain_array.each do |funding_round_with_domain|
            total_amt_invested += funding_round_with_domain.investment
        end
        total_amt_invested
    end
end
