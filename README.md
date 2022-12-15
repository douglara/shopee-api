# Shopee::Api

This Gem is basic http wrapper from Shopee API

Original documentation: https://open.shopee.com/developer-guide/

Support API V1 and V2

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shopee-api', git: 'https://github.com/douglara/shopee-api.git', branch: 'main'
```

And then execute:

    $ bundle install


## Usage

Instance the client:

```ruby
api = Shopee::Api.new({
      partner_id: 'SHOPEE_PARTNER_ID_V2',
      partner_key: 'SHOPEE_PARTNER_KEY_V2',
      redirect_uri: 'SHOPEE_REDIRECT_URI_V2',
      shopid: 'SHOPEE_SELLER_ID',
      production: true,
      api_version: 'v2',
      access_token: 'SHOPEE_ACCESS_TOKEN'
    })
```

Get last orders

```ruby
orders = api.get_orders({
				'order_status': 'READY_TO_SHIP',
				'time_range_field': 'update_time',
				'time_from': (Time.current.beginning_of_day - 10.day).to_i,
				'time_to': Time.current.end_of_day.to_i,
				'page_size': 100})

```

## Get Access Token

Instance the client:
* I didn`t not found a way without having the store id *

```ruby
api = Shopee::Api.new({
      partner_id: 'SHOPEE_PARTNER_ID_V2',
      partner_key: 'SHOPEE_PARTNER_KEY_V2',
      redirect_uri: 'SHOPEE_REDIRECT_URI_V2',
      shopid: 'SHOPEE_SELLER_ID',
      production: true,
      api_version: 'v2'
    })
```

Get auth url

```ruby
auth_url = api.build_auth_url(shopid: 'SHOPEE_SELLER_ID')
```

When accessing the auth url and authorizing the app you will be redirect to `redirect_uri` with *auth code* params, with that *auth code* you get *access token* and *refresh token*.

Get access token

```ruby
result = api.get_access_token('AUTH_CODE')
puts(result[:ok]['access_token'])
puts(result[:ok]['refresh_token'])
```

## Refresh access token


Instance the client:

```ruby
api = Shopee::Api.new({
      partner_id: 'SHOPEE_PARTNER_ID_V2',
      partner_key: 'SHOPEE_PARTNER_KEY_V2',
      redirect_uri: 'SHOPEE_REDIRECT_URI_V2',
      shopid: 'SHOPEE_SELLER_ID',
      production: true,
      api_version: 'v2',
      access_token: 'SHOPEE_ACCESS_TOKEN'
    })
```

Get new access token and refresh token

```ruby
new_token = api.refresh_token('SHOPEE_REFRESH_TOKEN')
puts(new_token[:ok]['access_token'])
puts(new_token[:ok]['refresh_token'])
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/douglara/shopee-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/douglara/shopee-api/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Shopee::Api project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/douglara/shopee-api/blob/master/CODE_OF_CONDUCT.md).
