module Comable
  module Apartment
    class ApplicationController < ActionController::Base
      include Comable::ApplicationHelper

      helper_method :current_comable_user

      layout 'comable/apartment/application'

      def current_ability
        Comable::Ability.new(current_comable_user)
      end

      def current_comable_user
        resource = current_root_user
        resource ||= current_admin_user if defined? Comable::Backend
        resource ||= current_user if defined? Comable::Frontend
        resource ||= Comable::User.new
        resource.with_cookies(cookies)
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

      def after_sign_in_path_for(_resource)
        comable_apartment.root_path
      end

      def after_sign_out_path_for(_resource)
        comable_apartment.new_root_user_session_path
      end
    end
  end
end
