FactoryGirl.define do
  factory :admin do
  end

  factory :membership do
    user
    group
  end

  factory :user do
    sequence(:username){ |n| "wombat_#{n}" }
    sequence(:email){ |n| "wombat_#{n}@testing.com" }
    password_digest "password"
  end

  factory :group do
    name "sauce"
  end
end
