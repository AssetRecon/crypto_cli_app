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
   input = nil
   while input != "exit"
     puts "Which currency do you want more info on? Enter: 1 - 25. Type exit to leave."
     input = gets.strip.downcase
     valid_input?(input)
   end
 end

 def valid_input?(input)
   #checks that input is between 1 - 25
   if (input.to_i > 0 && input.to_i < 26)
        detail(input)
    elsif input == "exit"
      goodbye 
    else
      puts "Please enter a valid number: 1 - 25."
    end
 end

 def goodbye
   puts "Check back later for updated prices. Bye."
 end

 def detail(input)
   #returns 2nd layer of detail for input that is passed in
   puts "This coin is currently being traded the most on the following exchanges:"
   puts <<-DOC
   1. Binance
   2. Bittrex
   DOC
  puts "Enter 1-2 to see the current trading price. Enter back to return to previous menu or exit to leave"
   new_input = gets.strip.downcase 
   case new_input
  when "exit"
    goodbye
  when back
    call
  when "1"
    detail_two(new_input)
  when "2"
    detail_two(new_input)
  end
     
 end

 def detail_two(input)
   #displays crypto's price
   
 end

 

end
