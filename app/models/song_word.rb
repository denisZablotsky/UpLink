class SongWord < ApplicationRecord
  belongs_to :word
  belongs_to :song
end
