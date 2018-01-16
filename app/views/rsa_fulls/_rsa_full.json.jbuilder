json.extract! rsa_full, :id, :n, :e, :d, :created_at, :updated_at
json.url rsa_full_url(rsa_full, format: :json)
