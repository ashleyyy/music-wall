class User < ActiveRecord::Base
  has_many :songs
  has_many :votes

  validates :username, presence: true
  validates :password, presence: true
  validates :email, format: /@/

end

