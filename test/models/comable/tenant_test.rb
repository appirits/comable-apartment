require 'minitest_helper'

class TenantTest < ActiveSupport::TestCase
  subject { build(:tenant) }

  should validate_uniqueness_of(:name)
  should validate_presence_of(:name)
  should validate_length_of(:name).is_at_most(255)
  should validate_length_of(:domain).is_at_most(255)

  test '.from_request should returns the tenant name when the request to the existing domain' do
    domain = 'domain.com'
    subject.update!(domain: domain)

    request = Minitest::Mock.new
    request.expect(:env, nil)
    request.expect(:domain, domain)

    ActionDispatch::Request.stub(:new, request) do
      assert_equal subject.class.from_request(request), subject.name
    end
  end

  test '.from_request should returns the tenant name when the request to the existing subdomain' do
    subdomain = 'subdomain'
    subject.update!(name: subdomain)

    request = Minitest::Mock.new
    request.expect(:env, nil)
    request.expect(:domain, nil)
    request.expect(:subdomains, [subdomain])

    ActionDispatch::Request.stub(:new, request) do
      assert_equal subject.class.from_request(request), subject.name
    end
  end

  test '.from_request should fails when the request to the nonexistent subdomain' do
    request = Minitest::Mock.new
    request.expect(:env, nil)
    request.expect(:domain, nil)
    request.expect(:subdomains, [])

    ActionDispatch::Request.stub(:new, request) do
      assert_raises(ActiveRecord::RecordNotFound) { subject.class.from_request(request) }
    end
  end
end
