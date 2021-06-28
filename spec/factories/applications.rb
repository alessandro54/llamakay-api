# frozen_string_literal: true

FactoryBot.define do
  factory :application do
    professional
    job
    custom_answers { {} }
  end
end
