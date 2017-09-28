class CreateJoinTablePostsAnswers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :posts, :answers do |t|
      t.index [:post_id, :answer_id], unique: true
      t.index [:answer_id, :post_id]
    end
  end
end
