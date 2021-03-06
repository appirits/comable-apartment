module Comable
  module Apartment
    class ApplicationController < ActionController::Base
      include Comable::ApplicationHelper
      include Comable::Apartment::ApplicationHelper

      helper_method :current_comable_user

      before_filter :authenticate_root_user!

      layout 'comable/apartment/application'

      def current_ability
        Comable::Ability.new(current_comable_user)
      end

      def current_comable_user
        current_root_user || Comable::User.new
      end

      private

      rescue_from CanCan::AccessDenied, with: :unauthorized

      def unauthorized
        if current_comable_user.signed_in?
          flash[:alert] = Comable::Apartment.t(:access_denied)
          redirect_to after_access_denied_path
        else
          store_location
          redirect_to comable_apartment.new_root_user_session_path
        end
      end

      # TODO: Implement this method after add the page for sign in as a another user
      def after_access_denied_path
        fail 'Please implement this method'
      end

      def after_sign_in_path_for(_resource_or_scope)
        case resource_name
        when :root_user
          comable_apartment.root_path
        # TODO: Delegate to Comable::ApplicationHelper
        when :admin_user
          comable.admin_root_path
        else
          session.delete(:user_return_to) || comable.root_path
        end
      end

      def after_sign_out_path_for(scope)
        after_sign_in_path_for(scope)
      end
    end
  end
end
