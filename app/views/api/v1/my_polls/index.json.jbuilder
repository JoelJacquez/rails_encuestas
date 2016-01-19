# json.array! @polls do |poll|
#   json.partial! 'api/v1/resource', resource: poll
#   # json.(poll, :id, :title, :description, :user_id, :expires_at, :expires_at)
# end

json.partial! 'api/v1/resource', collection: @polls, as: :resource
