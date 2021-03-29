module Music
  class ResearcherService < BaseService
    def call
      response = request
      return unless response

      result = []
      response = response.search('SearchLyricResult')
      response.pop

      response.each do |song_item|
        result << parse(song_item) if song_item
      end

      result
    end

    private

    def headers
      {
        artist: 'Artist',
        title: 'Song',
        lyric: 'Lyric',
        cover_url: 'CovertArtUrl'
      }
    end

    def url
      'SearchLyric'
    end
  end
end
