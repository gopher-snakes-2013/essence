FactoryGirl.define do
  factory :user do
    email "john@doe.com"
    password  "test123"
  end

  factory :topic do
    name 'Kermit'
    user
  end

  # factory :topic_with_snippet do
  #   snippets { |topic| [topic.association(:snippet)] }
  # end

  factory :snippet do
    content "it's not easy being green"
    topic
  end
end