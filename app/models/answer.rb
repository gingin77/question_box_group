class Answer < ApplicationRecord
  belongs_to :post, :user
end
