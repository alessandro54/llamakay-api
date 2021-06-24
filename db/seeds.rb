# frozen_string_literal: true

require 'factory_bot_rails'

puts 'Creating Companies'
FactoryBot.create_list(:company, 20)
puts 'Creating Recruiters'
FactoryBot.create_list(:recruiter, 10)
puts 'Creating Professionals'
FactoryBot.create_list(:professional, 10)
puts 'Creating Jobs'
FactoryBot.create_list(:job, 100)
puts 'Creating Applications'
FactoryBot.create_list(:job_application, 1000)
