require 'spec_helper'

FactoryGirl.define do

  factory :snippet do
    content Faker::Lorem.sentences
    topic
  end

  factory :topic do
    name Faker::Name.name
    user

    factory :topic_with_snippets do
      after(:create) do |topic|
        FactoryGirl.create_list(:snippet, 3, topic: topic)
      end
    end
  end

  factory :user do
    email Faker::Internet.email
    password  Faker::Internet.password

    factory :user_with_topic do
      after(:create) do |user|
        FactoryGirl.create_list(:topic, 1, user: user)
      end
    end

    factory :user_with_topics_with_snippets do
      after(:create) do |user|
        FactoryGirl.create_list(:topic_with_snippets, 3, user: user)
      end
    end

  end

end