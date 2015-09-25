Comable::Theme.class_eval do
  class << self
    def dir_with_tenant
      dir_without_tenant + ::Apartment::Tenant.current
    end

    alias_method_chain :dir, :tenant
  end
end
