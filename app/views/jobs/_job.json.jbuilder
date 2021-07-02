# frozen_string_literal: true

json.extract! job, :id, :title, :description, :seniority
json.company do
  json.id job.company.id
  json.name job.company.name
  json.logo_url job.company.logo_url
end
json.created_at job.created_at
