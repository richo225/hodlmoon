# Hodlmoon

Quickly find the price of your crypto portfolio from the comfort of your command line. When moon?

## Installation

Install it yourself:

    $ gem install hodlmoon

And then execute:

    $ bundle

## Usage

The gem comes with two methods that can be run : `price` and `list`.

### List

Lists market data for the top coins in a specific currency. If no limit is given, the top 5 will be shown. If no currency is given, the CLI will default to `gbp`:

```ruby
hodlmoon list
#
O==============O========O==============O================O===================O====================O===================O
|     name     | symbol |  price_gbp   | market_cap_gbp | percent_change_1h | percent_change_24h | percent_change_7d |
O==============O========O==============O================O===================O====================O===================O
|   Bitcoin    |  BTC   | 6076.719087  |  102446343662  |       +1.34       |       -0.63        |       -0.19       |
O==============O========O==============O================O===================O====================O===================O
|   Ethereum   |  ETH   | 609.6714501  | 59475842993.0  |       +1.31       |       -0.09        |       -1.57       |
O==============O========O==============O================O===================O====================O===================O
|    Ripple    |  XRP   | 0.746560517  | 29122740344.0  |       +2.1        |       +0.09        |      +23.24       |
O==============O========O==============O================O===================O====================O===================O
| Bitcoin Cash |  BCH   |  915.711888  | 15532419508.0  |       +1.38       |       +2.94        |       +9.73       |
O==============O========O==============O================O===================O====================O===================O
|   Cardano    |  ADA   | 0.2750981492 |  7132489119.0  |       +1.66       |       -3.71        |       -3.67       |
O==============O========O==============O================O===================O====================O===================O

hodlmoon list 2 eur
#
O==============O========O==============O================O===================O====================O===================O
|     name     | symbol |  price_eur   | market_cap_eur | percent_change_1h | percent_change_24h | percent_change_7d |
O==============O========O==============O================O===================O====================O===================O
|   Bitcoin    |  BTC   | 7212.121319  |  102446343662  |       +1.34       |       -0.63        |       -0.19       |
O==============O========O==============O================O===================O====================O===================O
|   Ethereum   |  ETH   | 719.35410933 | 59475842993.0  |       +1.31       |       -0.09        |       -1.57       |
O==============O========O==============O================O===================O====================O===================O
```

### Price

Gets the current price of a coin in a specific currency. If no currency is given, the CLI will default to `gbp`:

```ruby
hodlmoon price ethereum
# £608.12

hodlmoon price neo usd
# $101
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/richo225/hodlmoon. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Hodlmoon project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/richo225/hodlmoon/blob/master/CODE_OF_CONDUCT.md).
