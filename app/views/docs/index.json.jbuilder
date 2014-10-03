json.array!(@docs) do |doc|
  json.extract! doc, :id, :record_id
  json.url doc_url(doc, format: :json)
end
