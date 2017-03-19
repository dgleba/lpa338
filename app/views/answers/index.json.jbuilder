json.array!(@answers) do |answer|
  json.extract! answer, :id, :body, :choice_id, :question_id, :response_id, :issue, :action
  json.url answer_url(answer, format: :json)
end
