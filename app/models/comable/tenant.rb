module Comable
  class Tenant < ActiveRecord::Base
    extend FriendlyId

    validates :name, uniqueness: true, presence: true, length: { maximum: 255 }, exclusion: { in: %w( www ) }
    validates :domain, length: { maximum: 255 }

    after_create :create, unless: -> { Rails.env.test? }
    before_destroy :drop, unless: -> { Rails.env.test? }

    friendly_id :name

    class << self
      # @params request [ActionDispatch::Request] an instance of ActionDispatch::Request
      # @return [Tenant] The tenant instance to switch
      def from_request(request)
        tenant = find_by(domain: request.domain) if request.domain.present?
        tenant ||= find_by(name: request.subdomains.first)
        tenant ||= new
        tenant
      end
    end

    def name=(name)
      super name.try(:parameterize)
    end

    def create
      ::Apartment::Tenant.create(name)
    end

    def drop
      ::Apartment::Tenant.drop(name)
    end

    def switch
      ::Apartment::Tenant.switch(name) { yield }
    end

    def switch!
      if name
        ::Apartment::Tenant.switch!(name)
      else
        reset!
      end
    end

    def reset!
      ::Apartment::Tenant.switch!
    end
  end
end
