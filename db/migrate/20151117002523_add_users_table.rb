class AddUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email
      t.string :password, null: false
      t.timestamps
    end

    create_table :votes do |t|
      t.references :user
      t.references :song
      t.timestamps
    end

    change_table :songs do |t|
      t.references :user
    end



  end
end
