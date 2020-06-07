class VentureCapitalist
@@all = []
attr_reader :name, :total_worth

def initialize(name, total_worth)
  @name = name
  @total_worth = total_worth
  @@all << self
end

def offer_contract(startup, type, amount)
  FundingRound.new(startup, self, type, amount)
end

def funding_rounds
  FundingRound.all.count{|fr| fr.venture_capitalist == self }
end

def portfolio
  startups = []
  FundingRound.all.select{|fr| startups << fr.startup if fr.venture_capitalist == self }
  startups.map{ |startup| startup.name}.uniq
end

def biggest_investment
  frs = FundingRound.all.select{|fr| fr.investment if fr.venture_capitalist == self}
  frs.max{|fr| fr.investment}.venture_capitalist
end

def invested(domain)
  frs = FundingRound.all.select{ |fr| fr.venture_capitalist == self && fr.startup.domain == domain}
  frs.inject(0){ |sum, fr| sum + fr.investment }
end

def self.all
  @@all
end

def self.tres_commas_club
  @@all.select{ |vc| vc.total_worth > 1000000000}
end

end
