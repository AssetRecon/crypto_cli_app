require 'open-uri'
require 'pry'
require 'nokogiri'

class CryptoCliApp::Scraper

  def self.scrape_top_25(index_url)
    array = []
    doc =  Nokogiri::HTML(open(index_url))
  end

  def scrape_coin_details(coin_url)

  end







end
