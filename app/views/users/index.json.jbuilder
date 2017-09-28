json.users @users do |user|
  json.id user.id
  json.username user.username
  json.email user.email
  # json.url user_url(user)
end
