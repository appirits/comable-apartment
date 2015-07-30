ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
$LOAD_PATH.unshift File.expand_path('../../../../lib', __FILE__)

# Pick the frameworks you want:
require 'active_record/railtie'
require 'comable/apartment'

Bundler.require(*Rails.groups)

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
