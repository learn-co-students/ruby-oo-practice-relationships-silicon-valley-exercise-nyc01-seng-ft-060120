class Startup

    attr_reader :founder
    attr_accessor :name, :domain

    @@all = []

    def initialize(name,founder,domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end 

    def self.all
        @@all 
    end 

    def pivot(new_domain, new_name)
        self.domain = new_domain
        self.name = new_name
    end 

    def Startup.find_by_founder(founder_name)
        Startup.all.find {|startup| startup.founder == founder_name}
    end 

    def self.domains
        Startup.all.map {|startup| startup.domain}
    end 

end
