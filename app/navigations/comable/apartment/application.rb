AwesomeAdminLayout.setup(only: Comable::Apartment::ApplicationController) do |controller|
  # comable = controller.comable

  # navigation :apartment do
  navigation do
    brand Comable.app_name

    item Comable.t('apartment.dashboard') do
      link '/' #comable.apartment_root_path
      icon 'dashboard'
    end

    item Comable.t('apartment.tenants') do
      link '/'
      icon 'building'
    end
  end
end
