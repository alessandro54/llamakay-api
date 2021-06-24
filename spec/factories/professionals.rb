# frozen_string_literal: true

FactoryBot.define do
  factory :professional do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker:: Internet.password(min_length: 8, special_characters: true )}
    bio { Faker::Lorem.paragraph(random_sentences_to_add: 5) }
    experience { Faker::Lorem.paragraph(random_sentences_to_add: 5) }
    education { Faker::Lorem.paragraph(random_sentences_to_add: 5) }
  end
end
