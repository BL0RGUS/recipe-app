json.extract! recipe, :id, :name, :cuisine, :method, :user_id, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
