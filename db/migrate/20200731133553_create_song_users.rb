class CreateSongUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :song_users do |t|
      t.integer :song_id
      t.integer :user_id
    end

    add_index :song_users, :user_id
    add_index :song_users, :song_id
  end
end
