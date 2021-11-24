json.extract! user, :id, :first_name, :last_name, :email, :password, :token, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :function, :created_at, :updated_at
json.url user_url(user, format: :json)
