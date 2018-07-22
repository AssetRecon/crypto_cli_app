
class CryptoCliApp::Crypto
  attr_accessor :price, :pair, :volume, :exchange, :market_cap, :change_percentage, :coin, :coin_url

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

  def crypto_exchange
    #displays average price, market cap, 24h volume, change%. Also offers user to drill down on top two exchanges to view most popular trading pairs
    puts <<-DOC
    1. Binance
    2. Bittrex
    DOC

  end


  def crypto_exchange_price
    #displays trading price, volume, and trading pair for the selected exchange
    puts "This coin is currently trading at $1.25 USD on this exchange"
  end






end
