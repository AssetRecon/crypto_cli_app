
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

  def self.all
    @@all
  end




end
