#acts as enironment file
gem 'pry'
gem 'nokogiri', '1.6.6.2'
gem 'open-uri'

require_relative "./crypto_cli_app/version"
require_relative "./crypto_cli_app/cli"
require_relative "./crypto_cli_app/crypto"
require_relative "./crypto_cli_app/scraper"
