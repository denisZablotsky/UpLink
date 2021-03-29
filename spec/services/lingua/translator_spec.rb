require 'rails_helper'

describe Lingua::Translator do
  let!(:word) { 'phrase' }
  let!(:file) { File.read('spec/support/files/lingua/test_response.json') }

  context 'sends request to translation api' do
    before do
      stub_request(:any, ENV['TRANSLATION_API'] + "&word=#{word}").to_return(body: file, status: 200)
      @response = described_class.new(word).call
    end

    it 'should response with a Word' do
      expect(@response.value).to eq('test')
    end

    it 'should load translations' do
      expect(@response.translations.length).to eq(5)
    end
  end
end
