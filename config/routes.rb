Comable::Apartment::Engine.routes.draw do
  constraints Comable::Apartment::Constraint.new do
    root to: 'dashboard#show'

    devise_for :root_user, path: :user, class_name: Comable::User.name, module: :devise, router_name: :comable_apartment, controllers: {
      sessions: 'comable/apartment/user_sessions'
    }

    resources :tenants

    # TODO: Change to 404 page
    get '*path', controller: :dashboard, action: :show
  end
end
