json.array!(@questions) do |question|
  json.extract! question, :id, :name, :question_list_id, :sort, :qtype, :survey_id
  json.url question_url(question, format: :json)
end
