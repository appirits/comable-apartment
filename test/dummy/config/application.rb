ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
$LOAD_PATH.unshift File.expand_path('../../../../lib', __FILE__)

# Pick the frameworks you want:
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
require 'comable/apartment'

Bundler.require(*Rails.groups)

Devise.setup do |config|
  config.secret_key = '3404ed4c6c43ece78b1531f9e63e8bc5d01b3b89fd684d713fea8eea9b404cfc77d3fe195eaacf2dcae14ebdcb7911fc230e84fbd49f151403818d0a89960920'
end

module Dummy
  class Application < Rails::Application
    config.secret_token = '4c9d8af558e4d6d1fe799ca86af92235'
    config.session_store :cookie_store, key: '_dummy_app_session'
    config.active_support.deprecation = :log
    config.eager_load = false
    config.root = File.expand_path('../../', __FILE__)
  end
end

Rails.backtrace_cleaner.remove_silencers!

Dummy::Application.initialize!

# Routes
Rails.application.routes.draw do
  mount Comable::Apartment::Engine, at: '/'
  mount Comable::Core::Engine, at: '/'
  get ':page', controller: :dummy, action: :show
end

# Controllers
class DummyController < ActionController::Base
  def show
    @title = params[:page].capitalize if params[:page]
    render inline: <<-ERB
      <h1><%= @title %></h1>
      <h2>This is <%= @title %> Page.</h2>
    ERB
  end
end
