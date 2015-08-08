module Comable
  class Tenant < ActiveRecord::Base
    validates :name, uniqueness: true, presence: true, length: { maximum: 255 }, exclusion: { in: %w( www ) }
    validates :domain, length: { maximum: 255 }

    after_create :create, unless: -> { Rails.env.test? }
    before_destroy :drop, unless: -> { Rails.env.test? }

    class << self
      # @params request [ActionDispatch::Request] an instance of ActionDispatch::Request
      # @return [String] The tenant name to switch
      def name_from_request(request)
        tenant = find_by(domain: request.domain) if request.domain.present?
        tenant ||= find_by(name: request.subdomains.first)
        tenant.try(:name)
      end
    end

    def create
      ::Apartment::Tenant.create(name)
    end

    def drop
      ::Apartment::Tenant.drop(name)
    end
  end
end
