# Comable::Apartment

[![Build Status](https://img.shields.io/travis/appirits/comable-apartment.svg?style=flat-square)](http://travis-ci.org/appirits/comable-apartment)
[![Code Climate](https://img.shields.io/codeclimate/github/appirits/comable-apartment.svg?style=flat-square)](https://codeclimate.com/github/appirits/comable-apartment)
[![Dependency Status](https://img.shields.io/gemnasium/appirits/comable-apartment.svg?style=flat-square)](https://gemnasium.com/appirits/comable-apartment)
[![Gem Version](https://img.shields.io/gem/v/comable-apartment.svg?style=flat-square)](https://rubygems.org/gems/comable-apartment)

Multi-tenancy with [Comable](https://github.com/appirits/comable) using the [Apartment](https://github.com/influitive/apartment) gem.

## Installation

1. Add this line to your application's Gemfile:

  ```ruby
  gem 'comable-apartment'
  ```

2. And then execute:

  ```bash
  $ bundle
  ```

  Or install it yourself as:

  ```bash
  $ gem install comable-apartment
  ```

3. Run the generator:

  ```bash
  $ bin/rake comable_apartment:install:migrations
  ```

4.  Add the following to your `config/routes.rb`:

  ```ruby
  Rails.application.routes.draw do
    Comable::Apartment.routes self

    ...
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
