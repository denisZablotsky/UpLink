class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :cover_url
      t.string :lyric
      t.integer :lyric_id
      t.string :checksum
    end
  end
end
