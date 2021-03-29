module Music
  class BaseService
    BASE_URL = ENV['LYRICS_API']

    def initialize(artist, song)
      @artist = artist
      @song = song
    end

    private

    def request
      response = HTTParty.get(BASE_URL + url + params)
      Nokogiri::XML(response.to_s)
    end

    def parse(response)
      song = Song.new

      headers.each do |key, header|
        song[key] = value(response, header)
      end

      song
    end

    def params
      "?artist=#{artist}&song=#{song}"
    end

    def value(response, header)
      value = response.at(header)
      return unless value

      value.text
    end

    attr_reader :artist, :song
  end
end
