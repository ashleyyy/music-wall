class Vote < ActiveRecord::Base
  belongs_to :song

  validates :user_id, presence: true
  validates :song_id, presence: true

  validate :one_per_song

  def one_per_song
    errors.add(:vote, "only once per song") if self.song.votes.find_by(user_id: self.user_id)
  end

end