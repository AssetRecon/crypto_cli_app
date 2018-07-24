#CLI controller
class CryptoCliApp::CLI

 def call
   attribute_array = CryptoCliApp::Scraper.scrape_top_25("https://coinmarketcap.com/")
   CryptoCliApp::Scraper.create_crypto_from_array(attribute_array)
   list_crypto
   menu
 end

 def list_crypto
   #list the top 25 Cryptocurrencies by market cap
   puts "Today's Top 25 Cryptocurrencies By Market Capitalization Are:"
   top_crypto
 end

 def menu
   #ask user to select a currency to dril down then
   input = nil
     puts "Which currency do you want more info on? Enter: 1 - 25. Type exit to leave."
     input = gets.strip.downcase
     valid_input?(input) ? detail(input) : invalid_or_exit(input)
 end

 def valid_input?(input)
   #checks that input is between 1 - 25. Returns true or false.
   if (input.to_i > 0 && input.to_i < 26)
      true
    else
      false
    end
 end

 def invalid_or_exit(input)
   #If input is not between 1 - 25, is it "exit" or an invalid number?
   if input == "exit"
     goodbye
   else
   puts "Please enter a valid number 1 - 25."
   menu
  end
 end


 def goodbye
   puts "Check back later for updated prices. Bye."
 end

  def detail(input)
   #returns 2nd layer of detail for input that is passed in
   crypto_exchange(input)

  puts "Enter 1 or 2 to see the current trading prices on these exchanges. Enter back to return to previous menu or exit to leave"
   new_input = gets.strip.downcase

    while new_input != "1" && new_input != "2" && new_input != "back" && new_input != "exit"
      puts "please enter 1, 2, back, or exit"
       new_input = gets.strip.downcase
    end
    if new_input == "back" || new_input == "exit"
      back_or_exit(new_input)
    elsif new_input == "1" || new_input == "2"
    detail_two(new_input)
   end
 end

 def detail_two(input)
   #displays crypto's price. calls method that displays 2nd level of data by using input passed through.
   crypto_exchange_price(input)
   puts "Please enter back to return to the main menu or exit to leave the program."

new_input = nil
   while new_input != "back" && new_input != "exit"
     new_input = gets.strip.downcase
      puts "please enter back or exit"
    end
   back_or_exit(new_input) if new_input == "back" || new_input == "exit"
 end

 def back_or_exit(input)
   case input
  when "exit"
    goodbye
  when "back"
    call
  end
 end


   def top_crypto #will new to scrape this data from CoinMarketCap.com
     i = 0
     CryptoCliApp::Crypto.all[0..24].each {|crypto| puts "#{i += 1}. #{crypto.coin}"}
   end

   def crypto_exchange(input)
     #displays average price, market cap, 24h volume, change%. Also offers user to drill down on top two exchanges to view most popular trading prices
     #@@selection = input
     additional_attributes(input)
     puts "#{CryptoCliApp::Crypto.all[input.to_i-1].coin} is currently being traded for an average price of #{CryptoCliApp::Crypto.all[input.to_i-1].price}"
     puts "Current Market Capitalization: #{CryptoCliApp::Crypto.all[input.to_i-1].market_cap}"
     puts "24 Hour Trading Volume: #{CryptoCliApp::Crypto.all[input.to_i-1].volume}"
     puts "24 Hour Change Percentage: #{CryptoCliApp::Crypto.all[input.to_i-1].change_percentage}"
     puts "#{CryptoCliApp::Crypto.all[input.to_i-1].coin} is heavily traded on:"
     puts "1. #{CryptoCliApp::Crypto.all[input.to_i-1].exchange_1}"
     puts "2. #{CryptoCliApp::Crypto.all[input.to_i-1].exchange_2}"
   end

   def crypto_exchange_price(input)
     #displays prices for most popular exchanges
     if input == "1"
       puts "On #{CryptoCliApp::Crypto.all[input.to_i-1].exchange_1}, #{CryptoCliApp::Crypto.all[input.to_i-1].coin} is being traded at #{CryptoCliApp::Crypto.all[input.to_i-1].exchange_1_price}"
     elsif input == "2"
       puts "On #{CryptoCliApp::Crypto.all[input.to_i-1].exchange_2}, #{CryptoCliApp::Crypto.all[input.to_i-1].coin} is being traded at #{CryptoCliApp::Crypto.all[input.to_i-1].exchange_2_price}"
     end
   end

   def additional_attributes(input)
     CryptoCliApp::Crypto.all[input.to_i-1].exchange_1 = CryptoCliApp::Scraper.scrape_coin_details(CryptoCliApp::Crypto.all[input.to_i-1].coin_url)[0]
     CryptoCliApp::Crypto.all[input.to_i-1].exchange_2 = CryptoCliApp::Scraper.scrape_coin_details(CryptoCliApp::Crypto.all[input.to_i-1].coin_url)[2]
     CryptoCliApp::Crypto.all[input.to_i-1].exchange_1_price = CryptoCliApp::Scraper.scrape_coin_details(CryptoCliApp::Crypto.all[input.to_i-1].coin_url)[1]
     CryptoCliApp::Crypto.all[input.to_i-1].exchange_2_price = CryptoCliApp::Scraper.scrape_coin_details(CryptoCliApp::Crypto.all[input.to_i-1].coin_url)[3]
   end

end
