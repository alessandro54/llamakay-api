json.company_jobs do
    json.array! @jobs, partial: "jobs/job", as: :job
end
