json.array!(@swimmers) do |swimmer|
  json.extract! swimmer, :id, :asa_number, :asa_category, :date_of_birth, :sex, :photo_consent, :current_squad, :user_id
  json.url swimmer_url(swimmer, format: :json)
end
