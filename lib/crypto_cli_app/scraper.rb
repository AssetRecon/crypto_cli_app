require 'open-uri'
require 'pry'
require 'nokogiri'
class Scraper

  def self.scrape_top_25(index_url)
    array = []
    doc =  Nokogiri::HTML(open(index_url))
    doc.css("div.container table.table tbody tr")[0..24].each do |coin|
      array << {coin: coin.css("td.no-wrap a.currency-name-container").text,
                coin_url: coin.css("td.no-wrap a.currency-name-container").attribute("href").value ,
                price: coin.css("td.no-wrap a.price").text,
                volume: coin.css("td.no-wrap a.volume").text,
                market_cap: coin.css("td.no-wrap.market-cap").text ,
                change_percentage: coin.css("td.no-wrap.percent-change").text
                }
    end
  #binding.pry
  puts array
  end

  def scrape_coin_details(coin_url)

  end







end

Scraper.scrape_top_25("https://coinmarketcap.com/")
