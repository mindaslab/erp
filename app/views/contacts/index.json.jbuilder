json.array!(@contacts) do |contact|
  json.extract! contact, :id, :company_id, :name, :ph, :email, :address, :city, :zip, :country, :business, :customer, :supplier, :employee
  json.url contact_url(contact, format: :json)
end
