#CLI controller
class CryptoCliApp::CLI

 def call
   puts "Today's top 25 Current Cryptocurrencies"
   list_crypto
 end

 def list_crypto
   #list the top 25 Cryptocurrencies by market cap
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

 def menu
   #ask user to select a currency to dril down
   puts "Which currency do you want more info on? Enter 1 - 25"
 end

end
