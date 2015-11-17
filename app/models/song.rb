class Song < ActiveRecord::Base
  has_many :votes

  validates :song_title, presence: true
  validates :author, presence: true
  validates :url, format: { with: /https?:\/\/\w+.\w+.\w+\S*/ }, if: :url?


  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end
  
end

