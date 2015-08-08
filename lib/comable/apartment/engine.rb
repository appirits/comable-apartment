module Comable
  module Apartment
    class Engine < Rails::Engine
      isolate_namespace Comable::Apartment
    end
  end
end
