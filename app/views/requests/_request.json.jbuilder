json.extract! request, :id, :request, :trap_id, :created_at, :updated_at
json.url request_url(request, format: :json)
