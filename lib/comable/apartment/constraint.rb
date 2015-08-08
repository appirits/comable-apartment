module Comable
  module Apartment
    class Constraint
      def matches?(request)
        name = Comable::Tenant.name_from_request(request)

        if name
          ::Apartment::Tenant.switch!(name)
          return false
        end

        true
      end
    end
  end
end
