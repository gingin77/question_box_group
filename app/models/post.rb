class Post < ApplicationRecord
  has_many :answers
  belongs_to :user
end
