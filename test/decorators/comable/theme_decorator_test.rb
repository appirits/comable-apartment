require 'minitest_helper'

class Comable::ThemeTest < ActiveSupport::TestCase
  test '.dir should returns the directory path for current tenant' do
    assert_equal Comable::Theme.dir, Rails.root.join('themes', ::Apartment::Tenant.current)
  end
end
