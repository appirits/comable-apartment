require 'apartment'
require 'apartment/elevators/generic'
require 'comable/core'
require 'comable/apartment/elevator'
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
