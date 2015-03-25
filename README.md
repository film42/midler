# Midler

This is a fork of [Middleware](https://github.com/mitchellh/middleware) that allows multiple env arguments, and is fully backward compatible. Refer to the parent gem for additional documentation.

![Recite: "boil, boil, toil and trouble..."](midler.jpg)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'midler'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install midler

## Variadic Middleware Usage

This is where this fork of the gem really shines. We can now pass variadic arguments in place of env. For example, we can now call the stack with a `request` and `response` for this express-style webserver example.

```ruby
class JsonResponse
  def initialize(app)
    @app   = app
  end

  def call(request, response)
    Logger.info { "Received #{request[:body]} from request" }
    response[:accept] = "application/json"
    @app.call(request, response)
  end
end

stack = Midler::Builder.new do
  use JsonResponse
  use Authenticate
  use Authorized
end

# Run it!
stack.call(request, response)
```

## Singular Env Usage

Once you create a basic middleware, you can use the builder to
have a nice DSL to build middleware stacks. Calling the middleware
is simple, as well.

```ruby
# Basic middleware that just prints the inbound and
# outbound steps.
class Trace
  def initialize(app, value)
    @app   = app
    @value = value
  end

  def call(env)
    puts "--> #{@value}"
    @app.call(env)
    puts "<-- #{@value}"
  end
end

# Build the actual middleware stack which runs a sequence
# of slightly different versions of our middleware.
stack = Midler::Builder.new do
  use Trace, "A"
  use Trace, "B"
  use Trace, "C"
end

# Run it!
stack.call(nil)
```

And the output:

```
--> A
--> B
--> C
<-- C
<-- B
<-- A
```

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/film42/midler/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
