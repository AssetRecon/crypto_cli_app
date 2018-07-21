#CLI controller
class CryptoCliApp::CLI

 def call
   list_crypto
   menu
 end

 def list_crypto
   #list the top 25 Cryptocurrencies by market cap
   puts "Today's Top 25 Cryptocurrencies By Market Capitalization Are:"
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
   #ask user to select a currency to dril down then
   puts "Which currency do you want more info on? Enter 1 - 25. Type Exit to leave."
   input = gets.strip
   valid_input?(input)
 end

 def valid_input?(input)
   #checks that input is between 1 - 25
   if (input.to_i > 0 && input.to_i < 26)
      puts "calls method that shows more detail"
    else 
      puts "Please enter a valid number 1 - 25."
    end
 end

 def goodbye
   puts "Check back later for updated prices"
 end

 

end
