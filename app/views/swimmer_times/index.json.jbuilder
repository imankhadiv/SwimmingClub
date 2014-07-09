json.array!(@swimmer_times) do |swimmer_time|
  json.extract! swimmer_time, :id, :swimmer_id, :stroke, :distance, :times, :club, :venue, :date
  json.url swimmer_time_url(swimmer_time, format: :json)
end
