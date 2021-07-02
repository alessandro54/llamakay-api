# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    web_page { Faker::Internet.url }
    logo_url { Faker::LoremFlickr.image }
    description { Faker::Lorem.paragraph(random_sentences_to_add: 5) }
  end
end
