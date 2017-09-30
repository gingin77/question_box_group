json.posts @posts do |post|
    json.id post.id
    json.topic post.topic
    json.body post.body
    json.user_id post.user_id
    if post.user
      json.username post.user.username
    end
    json.answers post.answers do |answer|
      json.body answer.body
      if answer.user
        json.user answer.user.username
      end
    end
end
