require_dependency 'comable/apartment/application_controller'

module Comable
  module Apartment
    class UsersController < Comable::Apartment::ApplicationController
      load_and_authorize_resource :tenant, class: Comable::Tenant.name, find_by: :name
      before_filter :switch_tenant
      load_and_authorize_resource :user, class: Comable::User.name
      after_filter :reset_tenant

      def index
      end

      def show
        render :edit
      end

      def new
      end

      def create
        if @user.save
          redirect_to comable_apartment.tenant_user_path(@tenant, @user), notice: Comable.t(:successful)
        else
          flash.now[:alert] = Comable.t(:failure)
          render :new
        end
      end

      def edit
      end

      def update
        if @user.update_attributes(user_params)
          redirect_to comable_apartment.tenant_user_path(@tenant, @user), notice: Comable.t(:successful)
        else
          flash.now[:alert] = Comable.t(:failure)
          render :edit
        end
      end

      def destroy
        @user.destroy
        redirect_to comable_apartment.tenant_users_path(@tenant), notice: Comable.t(:successful)
      end

      private

      def user_params
        params.require(:user).permit(
          :email,
          :password,
          :role
        )
      end

      def switch_tenant
        @tenant.switch!
      end

      def reset_tenant
        @tenant.reset!
      end
    end
  end
end
