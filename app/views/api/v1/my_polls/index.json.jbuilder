json.array! @polls do |poll|
  json.(poll, :id, :title, :description, :expires_at, :expires_at)
end
