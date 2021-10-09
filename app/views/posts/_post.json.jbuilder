json.extract! post, :id, :owner_id, :title, :homepage_url, :message, :created_at, :updated_at
json.url post_url(post, format: :json)
