module Comable
  class Tenant < ActiveRecord::Base
    validates :name, uniqueness: true, presence: true, length: { maximum: 255 }, exclusion: { in: %w( www ) }
    validates :domain, length: { maximum: 255 }

    after_create :migrate, unless: -> { Rails.env.test? }

    class << self
      def from_request(request)
        # Rack::Request to ActionDispatch::Request
        request = ActionDispatch::Request.new(request.env)

        tenant = find_by(domain: request.domain)
        tenant ||= find_by!(name: request.subdomains.first)
        tenant.name
      end
    end

    def migrate
      ::Apartment::Tenant.create(name)
    end
  end
end
