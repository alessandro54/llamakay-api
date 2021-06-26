# frozen_string_literal: true

require 'factory_bot_rails'


# Dev Credentials
# Company
company = Company.create(
    name:"Alessandro's Kingdom",
    web_page: "alessandroparis.dev",
    logo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu5O22B-vfNk3K6XU6E4qCSIhRGFqfwWYJvw&usqp=CAU",
    description:  Faker::Lorem.paragraph(random_sentences_to_add: 5)
)
# Recruiter
Recruiter.create(
    first_name: "Favio",
    last_name: "Viera",
    email: "favio_smile@hotmail.com",
    role: "recruiter",
    company_id: company.id,
    password: "1234567"
)
FactoryBot.create_list(:job, 10, company_id: company.id)

# Dummy Data
puts 'Creating Companies'
FactoryBot.create_list(:company, 20)
puts 'Creating Recruiters'
FactoryBot.create_list(:recruiter, 10)
puts 'Creating Professionals'
FactoryBot.create_list(:professional, 10)
puts 'Creating Jobs'
FactoryBot.create_list(:job, 20)
puts 'Creating Applications'
FactoryBot.create_list(:job_application, 40)
