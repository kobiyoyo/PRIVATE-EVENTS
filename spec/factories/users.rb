FactoryBot.define do
  factory :user do
    sequence(:email){ |n| "emai#{n}@email.com"}

  end
    factory :user_two, class: User do
    sequence(:email){ |n| "aama#{n}@email.com"}

  end
end
