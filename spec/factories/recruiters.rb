# frozen_string_literal: true

FactoryBot.define do
  factory :recruiter do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker:: Internet.password(min_length: 8, special_characters: true )}
    company
  end
end
