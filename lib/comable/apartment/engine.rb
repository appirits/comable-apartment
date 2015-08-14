module Comable
  module Apartment
    class Engine < Rails::Engine
      isolate_namespace Comable::Apartment

      config.to_prepare do
        Dir.glob(Comable::Apartment::Engine.root.join('app/decorators/comable/*_decorator.rb')).each do |c|
          Rails.configuration.cache_classes ? require_dependency(c) : load(c)
        end
      end
    end
  end
end
