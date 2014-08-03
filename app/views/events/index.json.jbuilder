json.array!(@events) do |event|
  json.extract! event, :id, :date, :time, :title, :details, :user_id, :notification
  json.url event_url(event, format: :json)
end
