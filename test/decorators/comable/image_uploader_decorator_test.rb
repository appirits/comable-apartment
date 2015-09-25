require 'minitest_helper'

class ImageUploaderTest < ActiveSupport::TestCase
  test '#store_dir should returns the directory path for current tenant' do
    id = 1
    image = Comable::Image.new(id: id)
    assert_equal ImageUploader.new(image).store_dir, "uploads/#{::Apartment::Tenant.current}/comable/image/#{id}"
  end
end
