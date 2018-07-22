require 'open-uri'
require 'pry'
require 'nokogiri'
class Scraper

  def self.scrape_top_25(index_url)
    array = []
    counter = 0
    doc =  Nokogiri::HTML(open(index_url))
    doc.css("div.container table.table tbody tr").each do |coin|
      while counter < 25
        counter += 1
      array << {coin: coin.css("td.no-wrap a.currency-name-container").text,
                coin_url: coin.css("td.no-wrap a.currency-name-container").attribute("href").value ,
                price: coin.css("td.no-wrap")[2].text,
                volume: coin.css("td.no-wrap")[3].text,
                market_cap: coin.css("td.no-wrap")[1].text ,
                change_percentage: coin.css("td.no-wrap")[5].text
                }
              end
    end
    #binding.pry
  puts array
  end

  def scrape_coin_details(coin_url)

  end







end

Scraper.scrape_top_25("https://coinmarketcap.com/")
