require_dependency 'comable/apartment/application_controller'

module Comable
  module Apartment
    class DashboardController < Comable::Apartment::ApplicationController
      before_filter :authenticate_root_user!

      def show
      end
    end
  end
end
