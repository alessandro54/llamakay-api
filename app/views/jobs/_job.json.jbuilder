json.extract! job, :id, :company_id, :description, :seniority, :active, :custom_questions, :created_at, :updated_at
json.url job_url(job, format: :json)
