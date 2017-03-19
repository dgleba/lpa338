json.array!(@responses) do |response|
  json.extract! response, :id, :survey_id, :user_id, :ip
  json.url response_url(response, format: :json)
end
