json.posts @posts do |post|
    json.id post.id
    json.topic post.topic
    json.body post.body
    json.answers @posts.answers do |answer|
      json.body answer.body
      json.user answer.user
    end
end

json.id @post.id
json.topic @post.topic
json.body @post.body
json.answers @post.answers do |answer|
  json.body answer.body
  json.user answer.user
end
