json.extract! progress, :id, :student_id, :course_id, :completion_percentage, :status, :created_at, :updated_at
json.url progress_url(progress, format: :json)
