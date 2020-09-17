class Startup
    @@all = [] 
    attr_reader :founder, :name, :domain 

    def initialize(name, founder, domain) 
        @name = name 
        @founder = founder 
        @domain = domain 
        @@all << self 
    end 

    def pivot(domain_name, name) 
        self.domain = domain_name 
        self.name = name 
    end 

    def sign_contract(startup, venture_capitalist, investment_type, investment_amount) 
        FundingRound.new(self, venture_capitalist, investment_type, investment_amount) 
    end 

    def num_founding_rounds 
        FundingRound.all.count{|fr| fr.startup == self} 
    end 

    def total_funds 
        FundingRound.all.inject(0){|sum, fr| sum + fr.investment if fr.startup == self} 
    end 

    def investors 
        vcs = [] 
        FundingRound.all.select{|fr| vcs << fr.venture_capitalist if fr.startup == self} 
        vcs.map{|fr| fr.name}.uniq 
    end 

    def big_investors 
        vcs = [] 
        FundingRound.all.select{|fr| fr.venture_capitalist if fr.startup == self && VentureCapitalist.tres_comma_club.include?(fr.venture_capitalist)} 
        vcs.map{|fr| fr.name}.uniq
    end 

    def self.all 
        @@all 
    end 

    def self.find_by_founder(founder_name) 
        @@all.find{|startup| startup.founder == founder_name} 
    end 
    
    def self.domains 
        @@all.map{|domain| domain.domain} 
    end 

    private 
    attr_writer :domain, :name 
end