json.post @posts do |post|
    json.id post.id
    json.topic post.topic
    json.body post.body
end
