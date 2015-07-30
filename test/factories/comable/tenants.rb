FactoryGirl.define do
  factory :tenant, class: Comable::Tenant do
    sequence(:name) { |n| "tenant#{n.next}" }
    domain { "#{name}.com" }
  end
end
