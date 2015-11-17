class User < ActiveRecord::Base
  has_many :songs
  has_many :votes

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :email, uniqueness: true, format: /@/, if: :email?

end

