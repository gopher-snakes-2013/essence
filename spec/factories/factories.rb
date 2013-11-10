require 'spec_helper'

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password  Faker::Internet.password
  end

  factory :topic do
    name Faker::Name.name
    user
  end

  factory :snippet do
    content Faker::Lorem.sentences
    topic
  end
end