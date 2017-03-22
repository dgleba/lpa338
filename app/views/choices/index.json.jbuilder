json.array!(@choices) do |choice|
  json.extract! choice, :id, :name, :question_id, :sort, :active_status
  json.url choice_url(choice, format: :json)
end
