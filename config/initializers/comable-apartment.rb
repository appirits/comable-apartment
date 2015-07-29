Comable::Apartment.config do |config|
  config.excluded_models = Comable::Apartment::DEFAULT_EXCLUDED_MODELS
  config.tenant_names = -> { Comable::Tenant.pluck(:name) }
end
