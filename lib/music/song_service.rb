module Music
  class SongService < BaseService
    def call
      response = request
      return unless response

      parse(response)
    end

    private

    def parse(response)
      song = super(response)

      return unless song.lyric?

      song
    end

    def headers
      {
        artist: 'LyricArtist',
        title: 'LyricSong',
        lyric: 'Lyric',
        cover_url: 'LyricCovertArtUrl'
      }
    end

    def url
      'SearchLyricDirect'
    end
  end
end
