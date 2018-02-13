# Hodlmoon

Quickly find the price of your crypto portfolio from the comfort of your command line.

When moon?

![ethereum moon](https://user-images.githubusercontent.com/18379191/36102847-787a365a-1005-11e8-9121-ce3a477d3184.jpg)

## Installation

Install it yourself:

    $ gem install hodlmoon

## Usage

The gem comes with two methods that can be run : `price` and `list`.

### List

Lists market data for the top coins in a specific currency. If no limit is given, the top 5 will be shown. If no currency is given, the CLI will default to `gbp`:

```ruby
hodlmoon list
#
O==============O========O===============O================O===================O====================O===================O
|                                          ☾   ☾   ☾   Hodlmoon   ☽   ☽   ☽                                           |
O==============O========O===============O================O===================O====================O===================O
|     name     | symbol |   price_gbp   | market_cap_gbp | percent_change_1h | percent_change_24h | percent_change_7d |
O==============O========O===============O================O===================O====================O===================O
|   Bitcoin    |  BTC   | 6194.31180144 |  104438958744  |       -1.69       |       +2.13        |      +14.56       |
O==============O========O===============O================O===================O====================O===================O
|   Ethereum   |  ETH   | 611.451838746 | 59659761394.0  |       -1.66       |       +0.14        |      +13.49       |
O==============O========O===============O================O===================O====================O===================O
|    Ripple    |  XRP   | 0.7614421057  | 29703259449.0  |       -1.33       |       +0.51        |      +42.23       |
O==============O========O===============O================O===================O====================O===================O
| Bitcoin Cash |  BCH   |  905.989224   | 15368940724.0  |       -1.75       |       -0.82        |      +28.42       |
O==============O========O===============O================O===================O====================O===================O
|   Cardano    |  ADA   | 0.2704738498  |  7012594583.0  |       -1.64       |       -2.15        |      +10.23       |
O==============O========O===============O================O===================O====================O===================O

hodlmoon list 2 eur
#
O==========O========O===============O================O===================O====================O===================O
|                                        ☾   ☾   ☾   Hodlmoon   ☽   ☽   ☽                                         |
O==========O========O===============O================O===================O====================O===================O
|   name   | symbol |   price_eur   | market_cap_eur | percent_change_1h | percent_change_24h | percent_change_7d |
O==========O========O===============O================O===================O====================O===================O
| Bitcoin  |  BTC   | 6999.59148544 |  118016346256  |       -1.69       |       +2.13        |      +14.56       |
O==========O========O===============O================O===================O====================O===================O
| Ethereum |  ETH   | 690.942468096 | 67415714814.0  |       -1.66       |       +0.14        |      +13.49       |
O==========O========O===============O================O===================O====================O===================O
```

### Price

Gets the current price of a coin in a specific currency. If no currency is given, the CLI will default to `gbp`:

```ruby
hodlmoon price ethereum
#
O==========O========O===============O================O===================O====================O===================O
|                                        ☾   ☾   ☾   Hodlmoon   ☽   ☽   ☽                                         |
O==========O========O===============O================O===================O====================O===================O
|   name   | symbol |   price_gbp   | market_cap_gbp | percent_change_1h | percent_change_24h | percent_change_7d |
O==========O========O===============O================O===================O====================O===================O
| Ethereum |  ETH   | 608.540996151 | 59387446060.0  |       +0.54       |       -1.76        |       +26.1       |
O==========O========O===============O================O===================O====================O===================O

hodlmoon price neo usd
#
O======O========O===========O================O===================O====================O===================O
|                                    ☾   ☾   ☾   Hodlmoon   ☽   ☽   ☽                                     |
O======O========O===========O================O===================O====================O===================O
| name | symbol | price_usd | market_cap_usd | percent_change_1h | percent_change_24h | percent_change_7d |
O======O========O===========O================O===================O====================O===================O
| NEO  |  NEO   |  111.91   |  7274150000.0  |       +0.17       |       -0.72        |      +35.47       |
O======O========O===========O================O===================O====================O===================O
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/richo225/hodlmoon. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

Image by [@onedigitalartist](https://steemit.com/@onedigitalartist)

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Hodlmoon project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/richo225/hodlmoon/blob/master/CODE_OF_CONDUCT.md).
