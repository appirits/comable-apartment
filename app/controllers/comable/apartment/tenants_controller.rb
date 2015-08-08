require_dependency 'comable/apartment/application_controller'

module Comable
  module Apartment
    class TenantsController < Comable::Apartment::ApplicationController
      load_and_authorize_resource class: Comable::Tenant.name

      def index
        @tenants = @tenants.order(:created_at)
      end

      def show
        render :edit
      end

      def new
      end

      def create
        if @tenant.save
          redirect_to comable_apartment.tenant_path(@tenant), notice: Comable.t(:successful)
        else
          flash.now[:alert] = Comable.t(:failure)
          render :new
        end
      end

      def edit
      end

      def update
        if @tenant.update_attributes(tenant_params)
          redirect_to comable_apartment.tenant_path(@tenant), notice: Comable.t(:successful)
        else
          flash.now[:alert] = Comable.t(:failure)
          render :edit
        end
      end

      def destroy
        @tenant.destroy
        redirect_to comable_apartment.tenants_path, notice: Comable.t(:successful)
      end

      private

      def tenant_params
        params.require(:tenant).permit(
          :name,
          :domain
        )
      end
    end
  end
end
