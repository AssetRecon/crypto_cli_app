#CLI controller
class CryptoCliApp::CLI

 def call
   list_crypto
   menu
 end

 def list_crypto
   #list the top 25 Cryptocurrencies by market cap
   puts "Today's Top 25 Cryptocurrencies By Market Capitalization Are:"
   CryptoCliApp::Crypto.new.top_crypto
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
   CryptoCliApp::Crypto.new.crypto_exchange(input)

  puts "Enter 1 or 2 to see the current trading prices on these exchanges. Enter back to return to previous menu or exit to leave"
   new_input = gets.strip.downcase
   case new_input
  when "exit"
    goodbye
  when "back"
    call
  when "1"
    detail_two(new_input)
  when "2"
    detail_two(new_input)
  end
 end

 def detail_two(input)
   #displays crypto's price. calls method that displays 2nd level of data by using input passed through.
   CryptoCliApp::Crypto.new.crypto_exchange_price(input)
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


end
