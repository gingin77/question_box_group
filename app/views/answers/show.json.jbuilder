
json.id @answer.id
json.body @answer.body
json.user_id @answer.user_id
if @answer.user
  json.username @answer.user.username
end
