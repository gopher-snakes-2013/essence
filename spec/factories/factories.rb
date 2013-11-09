FactoryGirl.define do
  factory :user do
    email "john@doe.com"
    password  "test123"
  end

  factory :topic do
    name 'Ruby'
    user
  end
end