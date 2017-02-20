json.set! @photo.id do
  json.small image_url(@photo.small_picture)
  json.medium image_url(@photo.medium_picture)
  json.large image_url(@photo.large_picture)
end