json.posts @posts do |post|
    json.id post.id
    json.topic post.topic
    json.body post.body
    json.user_id post.user_id
    # json.username post.user.username
    json.answers post.answers do |answer|
      json.body answer.body
      json.user answer.user
    end
end
