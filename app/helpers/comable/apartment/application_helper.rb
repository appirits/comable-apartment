module Comable
  module Apartment
    module ApplicationHelper
      def link_to_save
        link_to Comable.t('apartment.save'), 'javascript:$("form").submit()', class: 'btn btn-primary'
      end

      def store_url_options(tenant)
        domain = tenant.domain.presence || request.domain
        subdomain = tenant.name if tenant.domain.blank?
        { domain: domain, subdomain: subdomain }
      end
    end
  end
end
