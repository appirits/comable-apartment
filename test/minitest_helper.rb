ENV['RAILS_ENV'] ||= 'test'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift File.dirname(__FILE__)

require File.expand_path('../dummy/config/application', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/mock'
require 'minitest/reporters'
require 'shoulda'
require 'factory_girl_rails'

# for Minitest Reporters
Minitest::Reporters.use!

# for Factory Girl
class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end
