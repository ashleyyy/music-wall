class AddMusic < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :song_title, null: false
      t.string :author, null: false
      t.string :url
      t.timestamps
    end
  end
end
