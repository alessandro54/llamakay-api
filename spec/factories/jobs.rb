# frozen_string_literal: true

FactoryBot.define do
  factory :job do
    company
    title { Faker::Company.profession }
    description { Faker::Lorem.paragraph }
    seniority { Job.seniorities.values.to_a.sample }
    active { Faker::Boolean.boolean(true_ratio: 0.8) }
    custom_questions { { 'Why do you want to work here': '' } }
  end
end
