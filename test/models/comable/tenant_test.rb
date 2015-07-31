require 'minitest_helper'

class TenantTest < ActiveSupport::TestCase
  subject { build(:tenant) }

  should validate_uniqueness_of(:name)
  should validate_presence_of(:name)
  should validate_exclusion_of(:name).in_array(%w( www ))
  should validate_length_of(:name).is_at_most(255)
  should validate_length_of(:domain).is_at_most(255)

  test '.from_request should returns the tenant name when the request to the existing domain' do
    domain = 'domain.com'
    subject.update!(domain: domain)

    request_mock do |request|
      request.stub(:domain, domain)

      assert_equal subject.class.from_request(request), subject.name
    end
  end

  test '.from_request should returns the tenant name when the request to the existing subdomain' do
    subdomain = 'subdomain'
    subject.update!(domain: nil, name: subdomain)

    request_mock do |request|
      request.stub(:domain, nil)
      request.stub(:subdomains, [subdomain])

      assert_equal subject.class.from_request(request), subject.name
    end
  end

  test '.from_request should fails when the request to the nonexistent domain' do
    subject.update!(domain: 'domain.com')

    request_mock do |request|
      request.stub(:domain, nil)
      request.stub(:subdomains, [])

      assert_raises(ActiveRecord::RecordNotFound) { subject.class.from_request(request) }
    end
  end

  test '.from_request should fails when the request to the nonexistent subdomain' do
    subject.update!(domain: nil, name: 'subdomain')

    request_mock do |request|
      request.stub(:domain, nil)
      request.stub(:subdomains, ['nonexistent subdomain'])

      assert_raises(ActiveRecord::RecordNotFound) { subject.class.from_request(request) }
    end
  end

  private

  def mock
    Class.new do
      def stub(method, value)
        singleton_class.send(:define_method, method) { value }
      end
    end
  end

  def request_mock
    request = mock.new
    request.stub(:env, nil)

    ActionDispatch::Request.stub(:new, request) do
      yield request
    end
  end
end
