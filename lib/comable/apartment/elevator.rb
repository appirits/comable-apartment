module Comable
  module Apartment
    class Elevator < ::Apartment::Elevators::Generic
      # @params request [Rack::Request] an instance of Rack::Request
      # @return [String] The tenant name to switch
      def parse_tenant_name(request)
        Comable::Tenant.from_request(request)
      end
    end
  end
end
