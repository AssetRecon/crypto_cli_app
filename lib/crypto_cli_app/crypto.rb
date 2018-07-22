
class CryptoCliApp::Crypto
  attr_accessor :price, :pair, :volume, :exchange_1, :exchange_2, :market_cap, :change_percentage, :coin, :coin_url, :exchange_1_price, :exchange_2_price
  @@selection = nil
  @@all = []
  def initialize(attribute_hash = nil)
   attribute_hash.each {|key, value| self.send(("#{key}="), value)} if attribute_hash != nil
   @@all << self
  end

  def self.create_from_collection(coin_array)
    coin_array.each {|attribute_hash| CryptoCliApp::Crypto.new(attribute_hash)}
  end

  def top_crypto #will new to scrape this data from CoinMarketCap.com
    i = 0
    @@all[0..24].each {|crypto| puts "#{i += 1}. #{crypto.coin}"}
  end

  def crypto_exchange(input)
    #displays average price, market cap, 24h volume, change%. Also offers user to drill down on top two exchanges to view most popular trading pairs
    @@selection = input
    puts "#{@@all[input.to_i-1].coin} is currently being traded for an average price of #{@@all[input.to_i-1].price}"
    puts "Current Market Capitalization: #{@@all[input.to_i-1].market_cap}"
    puts "24 Hour Trading Volume: #{@@all[input.to_i-1].volume}"
    puts "24 Hour Change Percentage: #{@@all[input.to_i-1].change_percentage}"
    puts "#{@@all[input.to_i-1].coin} is heavily traded on:"
    puts "1. #{@@all[input.to_i-1].exchange_1}"
    puts "2. #{@@all[input.to_i-1].exchange_2}"
  end

  def crypto_exchange_price(input)
    #displays trading price, volume, and trading pair for the selected exchange
    @@selection.exchange_1 = Scraper.new(@@selection.coin_url)[0]
    @@selection.exchange_2 = Scraper.new(@@selection.coin_url)[2]
    @@selection.exchange_1_price = Scraper.new(@@selection.coin_url)[1]
    @@selection.exchange_2_price = Scraper.new(@@selection.coin_url)[3]
    if input == "1"
      puts "On #{@@all[@@selection.to_i-1].exchange_1}, #{@@all[@@selection.to_i-1].coin} is being traded at #{@@all[@@selection.to_i-1].exchange_1_price}"
    elsif input == "2"
      puts "On #{@@all[@@selection.to_i-1].exchange_2}, #{@@all[@@selection.to_i-2].coin} is being traded at #{@@all[@@selection.to_i-2].exchange_1_price}"
    end
  end






end
