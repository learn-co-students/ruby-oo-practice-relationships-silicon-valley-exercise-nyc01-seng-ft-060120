class Startup

   attr_reader  :name, :domain, :founder

    @@all = []

    def initialize (name, domain, founder)
        @name = name
        @domain = domain 
        @founder =  founder 
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
        @self
    end

    def self.find_by_founder(founder)
        @@all.find do |name|
            name.founder == founder
        end
    end

    def self.domains
        @@all.map do |domain|
            domain.domain 
        end
    end

    def sign_contract (startup, venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)
    end

    def num_funding_rounds 
        FundingRound.all.inject(0) do |sum, amount| 
            sum + amount.investment 
            if amount.startup == self
            end
        end
    end

    def total_funds 
        FundingRound.all.inject(0){ |sum, fr| sum + fr.investment if fr.startup == self }
    end

    def investors 
        vcs = []
        FundingRound.all.select{|fr| vcs << fr.venture_capitalist if fr.startup == self}
         vcs.map {|fr| fr.name}.uniq
    end

    def big_investors
        vcs = []
        FundingRound.all.select { |fr| fr.venture_capitalist if fr.startup == self && VentureCapitalist.tres_commas_club.include?(fr.venture_capitalist) } 
        vcs.map {|fr| fr.name}.uniq
    end 

    private
    attr_writer :domain, :name

end