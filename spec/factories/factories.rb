require 'spec_helper'

FactoryGirl.define do

  factory :source do
    title "Alek Sucks"
    url "http://www.google.com"
  end
  factory :snippet do
    content Faker::Lorem.sentences
    source
    user
  end

  factory :topic do
    name Faker::Name.name
    user

    factory :topic_with_snippets do
      after(:create) do |topic|
        FactoryGirl.create_list(:snippet, 1, topic: topic, user: topic.user)
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
        FactoryGirl.create_list(:topic_with_snippets, 1, user: user)
      end
    end
  end
end