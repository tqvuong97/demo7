json.extract! article, :id, :title, :description, :created_at, :updated_at, :uploader
json.url article_url(article, format: :json)
