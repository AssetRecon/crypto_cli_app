# CryptoCliApp

This command line application scrapes data from CoinMarketCap.com for the top 25 cryptocurrencies by market capitalization.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'crypto_cli_app'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install crypto_cli_app

## Usage

You will be greeted and presented with a listing of the current top 25 cryptocurrencies per CoinMarketCap.com. When prompted,
enter the number corresponding to the coin you would like to get more information about.

Next, you will be presented with additional information, as well as the option to enter a corresponding number again to receive even more information. You may exit
at any time by entering "exit" or return to the main menu by entering "back".

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'AssetRecon'/crypto_cli_app.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
