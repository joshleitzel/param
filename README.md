# param

In Rails, you can define a `to_param` method on any ActiveRecord model:

```ruby
class Order < ActiveRecord::Base
  def to_param
    number
  end
end
```

Now, the order’s `number` is used instead of its `id` when a route is generated:

```ruby
order = Order.create(number: 'R1234')
order_path(order) #=> '/orders/R1234'
```

However, you’re still left to look up the order by its number manually:

```ruby
class OrdersController < ApplicationController
  def show
    @order = Order.find_by(number: params[:id])
  end
end
```

This library adds a `from_param` method to your model classes to do this lookup automatically:

```ruby
Order.from_param(params[:id])
```

## Installation

Add this line to your application's Gemfile:

```
gem 'param', '~> 0.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install param

## Usage

Use the `param` DSL on any ActiveRecord model to specify the name of the param attribute:

```ruby
class Order < ActiveRecord::Base
  param :number
end
```

Pass the `to_s` option if you want the param to also be used as the model’s `to_s` method:

```ruby
class Order < ActiveRecord::Base
  param :number, to_s: true
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
