module Comable
  module Apartment
    class Constraint
      class << self
        def matches?(request)
          request_to_apartment? request
        end

        private

        def request_to_apartment?(request)
          tenant = Comable::Tenant.from_request(request)
          tenant.switch!
          tenant.new_record?
        end
      end
    end
  end
end
