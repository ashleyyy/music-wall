class Song
  validates :song_title, presence: true
  validates :author, presence :true
  # validates :url_format if: :url

  # def url_format
  #   url.match(/https?:\/\/\w+.\w+.\w+\S*/)
  # end
end
