require 'slim-rails'
require 'sass-rails'
require 'coffee-rails'
require 'compass-rails'
require 'uglifier'
require 'bootstrap-sass'
require 'font-awesome-rails'
require 'jquery-rails'
require 'jquery-ui-rails'
require 'raphael-rails'
require 'morrisjs-rails'
require 'nprogress-rails'
require 'turbolinks'
require 'jquery-turbolinks'
require 'awesome_admin_layout'

require 'apartment'
require 'apartment/elevators/generic'
require 'comable/core'
require 'comable/apartment/constraint'
require 'comable/apartment/engine'
require 'comable/apartment/version'

module Comable
  module Apartment
    DEFAULT_EXCLUDED_MODELS = %w(
      Comable::Tenant
    )

    class << self
      delegate :excluded_models, :tenant_names, to: ::Apartment

      def config
        yield self if block_given?
      end

      def excluded_models=(models)
        ::Apartment.configure { |config| config.excluded_models = models }
      end

      def tenant_names=(names)
        ::Apartment.configure { |config| config.tenant_names = names }
      end
    end
  end
end
