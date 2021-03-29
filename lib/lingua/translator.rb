module Lingua
  class Translator
    BASE_URL = ENV['TRANSLATION_API']

    def initialize(phrase)
      @phrase = phrase
    end

    def call
      response = HTTParty.get(full_url(phrase))
      parse JSON.parse(response)
    end

    private

    def full_url(phrase)
      BASE_URL + phrase
    end

    def parse(response)
      word = Word.new
      word.value = value(response, 'word_value')
      word.transcription = value(response, 'transcription')
      word.sound_url = value(response, 'sound_url')
      translations = value(response, 'translate')
      translations.each do |item|
        translation = Translation.new
        translation.value = value(item, 'translate_value')
        translation.picture_url = value(item, 'pic_url')
        word.translations << translation
      end
      word
    end

    def value(array, item)
      array.find { |element| element.first == item }&.second
    end

    attr_reader :phrase
  end
end
