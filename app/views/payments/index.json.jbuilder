json.array!(@payments) do |payment|
  json.extract! payment, :id, :swimmer_id, :details, :amount, :paid, :due_date, :paid_date
  json.url payment_url(payment, format: :json)
end
