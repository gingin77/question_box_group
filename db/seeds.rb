# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Post.delete_all

Post.create(
  topic: "My Very First Post",
  body:
  %Q{### This is our first post........}
)


Post.create(
  topic: "My Very First Post",
  body:
  %Q{### My List of Things To Do!

  Here is the list of things I wish to do!

  * write more posts
  * write even more posts
  * write even more posts!}
)
