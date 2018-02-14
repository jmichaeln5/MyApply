json.extract! job, :id, :company, :position, :language, :skills, :state, :salary, :comments, :site, :created_at, :updated_at
json.url job_url(job, format: :json)
