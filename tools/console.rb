require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#STARTUP
s1 = Startup.new("Apple", "Steve Jobs", "www.apple.com")
s2 = Startup.new("Windows", "Bill Gates", "www.windows.com")
s3 = Startup.new("Tesla", "Elon Musk", "www.tesla.com")

#VENTURE CAPITALIST
v1 = VentureCapitalist.new("May", 123456789)
v2 = VentureCapitalist.new("Lucy", 1234567891)
v3 = VentureCapitalist.new("Suzie", 9876543210)

#FUNDING ROUND




binding.pry
0 #leave this here to ensure binding.pry isn't the last line