module Comable
  module Apartment
    class Elevator
      def initialize(app)
        @app = app
      end

      def call(env)
        request = ActionDispatch::Request.new(env)

        database = parse_tenant_name(request)

        if database
          ::Apartment::Tenant.switch!(database) if database
          @app.call(env)
        else
          response = Comable::Apartment::Engine.routes.call(env)
          response = @app.call(env) if response.first == 404
          response
        end

      end

      # @params request [ActionDispatch::Request] an instance of ActionDispatch::Request
      # @return [String] The tenant name to switch
      def parse_tenant_name(request)
        Comable::Tenant.name_from_request(request)
      end
    end
  end
end
