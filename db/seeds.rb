# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# test

  title1 = Post.create(topic: "What is the most difficult concept you've encountered in programming?", body: "ha ha ha aha ahahaha")
  title2 = Post.create(topic: "Our second Post", body: "test 2")

  answer1 = Answer.create(body: "
  rake db:rollback STEP=1

  Is a way to do this, if the migration you want to rollback is the last one applied. You can substitute 1 for however many migrations you want to go back.

  For example:

  rake db:rollback STEP=5

  Will also rollback all the migration that happened later (4, 3, 2 and also 1).

  As suggested in comments:

  In order to rollback a specific migration use:

  rake db:migrate:down VERSION=20100905201547", user: "Zachary Wright")

  answer2 = Answer.create(body: "

  rake db:migrate:down VERSION=20100905201547

  will roll back the specific file.

  To find the version of all migrations, you can use this command:

  rake db:migrate:status

  Or, simply the prefix of the migration's file name is the version you need to rollback.

  See the Ruby on Rails guide entry on migrations.", user: "John Creamer")


  # Original post used for title3 and answers 1&2:  https://stackoverflow.com/questions/3647685/how-to-rollback-a-specific-migration

  title3 = Post.create(topic: "How to rollback a specific migration?", body: "I have the following migration file db> migrate > 20100905201547_create_blocks.rb

  How can I specifically rollback that migration file?", answers: [answer1, answer2])

  user1 = User.create(username:"users",email:"user@example.com",password:"secret")
  user2 = User.create(username:"lyman",email:"lyman.johnson@gmail.com",password:"secret")
