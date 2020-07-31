class Word < ApplicationRecord
  belongs_to :user
  has_many :translations
  has_many :song_words, dependent: :delete_all
  has_many :songs, through: :song_words
end
