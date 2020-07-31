class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :value
      t.string :transcription
      t.string :sound_url
      t.integer :status
      t.integer :user_id, index: true
    end
  end
end
