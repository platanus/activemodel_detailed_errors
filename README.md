# ActiveModel Detailed Errors

This is just a temporary gem to bring [this feature](https://github.com/rails/rails/pull/18322) that is scheduled for Rails 5 to the ancient world of Rails 4. This is a blatant copy and paste of that PR so full forward compatibility is ensured.

## What this does?

If you didn't read the PR, this is a fix to what `ActiveModel#Error` does. When you validate something, you get errors wrapped in this object. In Rails 3 and 4, this object just contained a simple **string** with the message of the validation. That was a very limited behavior because when you did this:

```ruby
errors.add(:base, :not_enough_monkeys, count: 100)
```

Rails just saved the errors as this (or something similar because it depends on your localization files):

```ruby
model.errors
{ base: ["Not Enough Monkeys. Maximum: 100"] }
# and nothing anymore...
```

It coupled internationalization with errors. You can't give a programmers a string, buddy! We need objects and data, not strings!

So, that PR fixed this by storing the error as it is too, in the method `details`. So you can do this now:

```ruby
model.errors.details
{ base: [{ error: :not_enough_monkeys, count: 100 }] }
```

So you get two things if you make apis that should be translated in the client:

- You have objects! (Your api consumers will love you)
- You don't need to use i18n for format api errors. You can have an admin interface with good error messages now!

## Installation

As with all the other gems you used before, add it to your Gemfile:

```ruby
gem "activemodel_detailed_errors"
```

And END.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
