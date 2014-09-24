json.array!(@collabs) do |collab|
  json.extract! collab, :id, :email, :company_id
  json.url collab_url(collab, format: :json)
end
