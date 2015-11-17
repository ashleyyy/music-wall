class Review < ActiveRecord::Base
  belongs_to :song
  belongs_to :user

  validates :user_id, presence: true
  validates :song_id, presence: true

  validate :one_per_song

  def one_per_song
    errors.add(:review, "only once per song") if self.song.reviews.find_by(user_id: self.user_id)
  end

end