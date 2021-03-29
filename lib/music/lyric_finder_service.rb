module Music
  class LyricFinderService < ResearcherService
    def initialize(lyric_text)
      @lyric_text = lyric_text
    end

    private

    def url
      'SearchLyricText'
    end

    def params
      "?lyricText=#{lyric_text}"
    end

    attr_reader :lyric_text
  end
end
