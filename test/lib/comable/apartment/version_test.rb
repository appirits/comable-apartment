require 'minitest_helper'

class VersionTest < ActiveSupport::TestCase
  test 'Comable::Apartment has a version number' do
    refute_nil Comable::Apartment::VERSION
  end
end
