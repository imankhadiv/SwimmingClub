json.array!(@swimming_records) do |swimming_record|
  json.extract! swimming_record, :id, :first_name, :last_name, :date_of_birth, :gender, :stroke, :distance, :level, :meet, :venue, :time, :age, :date, :region, :region, :region_code
  json.url swimming_record_url(swimming_record, format: :json)
end
