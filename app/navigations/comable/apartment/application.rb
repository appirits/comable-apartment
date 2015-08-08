AwesomeAdminLayout.setup(only: Comable::Apartment::ApplicationController) do |controller|
  comable_apartment = controller.comable_apartment
  current_comable_user = controller.current_comable_user

  navigation do
    brand Comable.app_name

    item Comable.t('apartment.dashboard') do
      link comable_apartment.root_path
      icon 'dashboard'
    end

    item Comable.t('apartment.tenants') do
      link comable_apartment.tenants_path
      icon 'building'
    end

    flex_divider

    item current_comable_user.email do
      nest :profile
      icon 'gift'
    end
  end

  navigation :profile do
    brand current_comable_user.email

    item Comable::Apartment.t(:sign_out) do
      link comable_apartment.destroy_root_user_session_path, method: :delete
    end
  end
end
