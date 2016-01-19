# json.(@poll, :id, :title, :description, :expires_at, :expires_at)
json.partial! 'api/v1/resource', resource: @poll
