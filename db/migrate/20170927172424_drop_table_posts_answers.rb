class DropTablePostsAnswers < ActiveRecord::Migration[5.1]
  def change
    drop_table :answers_posts
  end
end
