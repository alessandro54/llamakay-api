# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { Faker::Kpop.girl_groups }
    web_page { Faker::Internet.url }
    logo_url { Faker::Internet.url }
    description { Faker::Lorem.paragraph(random_sentences_to_add: 5) }
  end
end
