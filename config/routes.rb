Comable::Apartment::Engine.routes.draw do
  scope module: :apartment do
    root to: 'dashboard#show'

    resource :dashboard, only: :show
  end
end
