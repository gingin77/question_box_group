class User < ApplicationRecord
  has_secure_password
  has_secure_token # :auth_token (TODO: what did this do?)

  validates_uniqueness_of :email
  validates_presence_of :email
  validates_presence_of :username
end
