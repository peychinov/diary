json.array!(@entries) do |entry|
  json.extract! entry, :content
  json.url entry_url(entry, format: :json)
end
