class Song < ApplicationRecord
  has_many :song_users, dependent: :delete_all
  has_many :users, through: :song_users
  has_many :song_words, dependent: :delete_all
  has_many :words, through: :song_words
end
