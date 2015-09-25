require 'minitest_helper'

class Comable::ImageUploaderTest < ActiveSupport::TestCase
  test '#store_dir should returns the directory path for current tenant' do
    id = 1
    image = Comable::Image.new(id: id)
    assert_equal Comable::ImageUploader.new(image).store_dir, "uploads/#{::Apartment::Tenant.current}/comable/image/#{id}"
  end
end
