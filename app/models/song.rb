class Song < ActiveRecord::Base
  validates :song_title, presence: true
  validates :author, presence: true
  validates :url, format: {with: /https?:\/\/\w+.\w+.\w+\S*/}, if: :url

  # def url_format
  #   errors.add(:url) .match() == url
  # end
end
