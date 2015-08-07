module Comable
  class Tenant < ActiveRecord::Base
    validates :name, uniqueness: true, presence: true, length: { maximum: 255 }, exclusion: { in: %w( www ) }
    validates :domain, length: { maximum: 255 }

    after_create :migrate, unless: -> { Rails.env.test? }

    class << self
      def name_from_request(request)
        tenant = find_by(domain: request.domain) if request.domain.present?
        tenant ||= find_by(name: request.subdomains.first)
        tenant.try(:name)
      end
    end

    def migrate
      ::Apartment::Tenant.create(name)
    end
  end
end
