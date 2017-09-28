json.id @post.id
json.topic @post.topic
json.body @post.body
json.answers @post.answers do |answer|
  json.body answer.body
  json.user answer.user
end
