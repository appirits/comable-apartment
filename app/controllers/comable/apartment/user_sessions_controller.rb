module Comable
  module Apartment
    class UserSessionsController < Devise::SessionsController
      helper Comable::Apartment::ApplicationHelper
      layout 'comable/apartment/application'
    end
  end
end
