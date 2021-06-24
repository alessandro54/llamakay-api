# frozen_string_literal: true

FactoryBot.define do
  factory :job_application do
    professional
    job
    custom_answers { {} }
  end
end
