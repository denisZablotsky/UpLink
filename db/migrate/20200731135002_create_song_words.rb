class CreateSongWords < ActiveRecord::Migration[5.2]
  def change
    create_table :song_words do |t|
      t.integer :song_id
      t.integer :word_id
    end
  end
end
