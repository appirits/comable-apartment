FactoryGirl.define do
  factory :user, class: Comable::User do
    sequence(:email) { |n| "comable-apartment+#{n.next}@example.com" }
    role :admin
  end
end
