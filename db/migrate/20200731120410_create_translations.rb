class CreateTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :translations do |t|
      t.string :value
      t.string :picture_url
      t.integer :word_id, index: true
    end
  end
end
