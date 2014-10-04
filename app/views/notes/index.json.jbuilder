json.array!(@notes) do |note|
  json.extract! note, :id, :content, :record_id
  json.url note_url(note, format: :json)
end
