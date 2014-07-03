json.array!(@parents) do |parent|
  json.extract! parent, :id, :relation, :user_id
  json.url parent_url(parent, format: :json)
end
