Comable::User.class_eval do
  enumerize :role, in: %i(
    root
    admin
    reporter
    customer
  ), default: :customer, predicates: true, scope: true
end
