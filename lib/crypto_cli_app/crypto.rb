class CryptoCliApp::Crypto
  attr_accessor :price, :pair, :volume, :exchange, :market_cap, :change_percentage, :coin

  def top_crypto #will new to scrape this data from CoinMarketCap.com
    puts <<-DOC
    1	Bitcoin
    2	Ethereum
    3	XRP
    4	Bitcoin Cash
    5	EOS
    6	Stellar
    7	Litecoin
    8	Cardano
    9	IOTA
    10	Tether
    11	TRON
    12	NEO
    13	Monero
    14	Dash
    15	Ethereum Classic
    16	NEM
    17	Tezos
    18	Binance Coin
    19	VeChain
    20	OmiseGO
    21	Zcash
    22	Qtum
    23	Bitcoin Diamond
    24	0x
    25	Decred
    DOC
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
