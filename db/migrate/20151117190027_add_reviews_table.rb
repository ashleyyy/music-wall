class AddReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, null: false
      t.references :song, null: false
      t.text :content, null: false
      t.timestamps null: false
    end

  end
end
