json.array!(@records) do |record|
  json.extract! record, :id, :amount, :description, :book_id, :status
  json.url record_url(record, format: :json)
end
