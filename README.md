# Comable::Apartment

[![Build Status](https://img.shields.io/travis/appirits/comable-apartment.svg?style=flat-square)](http://travis-ci.org/appirits/comable-apartment)

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'comable-apartment'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install comable-apartment

Add the following to your `config/application.rb`:

```ruby
module MyApplication
  class Application < Rails::Application
    ...

    config.middleware.use 'Comable::Apartment::Elevator'

    ...
  end
end
```

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/comable-apartment/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
