FactoryGirl.define do
  factory :group_membership do
  end

  factory :user do
    email "wombat@testing.com"
    password_digest "password"
  end

  factory :group do
    name "sauce"
  end
end
