json.array!(@questions) do |question|
  json.extract! question, :id, :name, :qtype, :survey_id, :sort, :active_status
  json.url question_url(question, format: :json)
end
