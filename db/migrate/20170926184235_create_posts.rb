class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :topic
      t.text :body

      t.timestamps
    end
  end
end
