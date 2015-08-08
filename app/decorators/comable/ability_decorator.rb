Comable::Ability.class_eval do
  def initialize_with_root(user)
    case user.try(:role)
    when 'root'
      can :manage, :all
      return
    when 'admin'
      cannot :manage, Comable::Tenant
    when 'reporter'
      cannot :read, Comable::Tenant
    end

    initialize_without_root(user)
  end

  alias_method_chain :initialize, :root
end
