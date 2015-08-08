Comable::Apartment::Engine.routes.draw do
  constraints Comable::Apartment::Constraint.new do
    root to: 'dashboard#show'

    # TODO: Change to 404 page
    get '*path', controller: :dashboard, action: :show
  end
end
