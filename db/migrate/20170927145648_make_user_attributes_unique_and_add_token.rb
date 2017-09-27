class MakeUserAttributesUniqueAndAddToken < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :token, :string
    add_index :users, :token, unique: true
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
