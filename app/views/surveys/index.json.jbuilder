json.array!(@surveys) do |survey|
  json.extract! survey, :id, :name, :sort, :active_status
  json.url survey_url(survey, format: :json)
end
