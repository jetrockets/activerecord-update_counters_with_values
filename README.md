# ActiveRecord::UpdateCountersWithValues

Update ActiveRecord counter and update instance value

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-update_counters_with_values', require: 'active_record/update_counters_with_values'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-update_counters_with_values

## Usage

```ruby
class MyModel < ActiveRecord::Base
  include Activerecord::UpdateCountersWithValues

  #...
end
```

### Class methods

```ruby
MyModel.update_counters_and_return_values(1, comments_count: 1)
MyModel.update_counters_and_return_values(1, comments_count: 1, another_count: 2)
MyModel.update_counters_and_return_values([1,2], comments_count: 1, another_count: 2)

MyModel.increment_counter_and_return_value(1, :comments_count)
MyModel.decrement_counter_and_return_value(1, :comments_count)
```

### Instance methods

```ruby
document = Document.first
document.update_counters_with_values(comments_count: 1)
document.update_counters_with_values(comments_count: 1, another_count: 2)

document.increment_counter_with_value(:comments_count)
document.decrement_counter_with_value(:comments_count)
```

## Credits

Sponsored by [JetRockets](http://www.jetrockets.pro).

![JetRockets](http://jetrockets.pro/JetRockets.jpg)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
