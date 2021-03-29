require 'rails_helper'

describe Music::LyricFinderService do
  let!(:text) { 'phrase' }
  let!(:file) { File.read('spec/support/files/music/researcher_response.xml') }
  let!(:empty_file) { File.read('spec/support/files/music/empty_response.xml') }
  let!(:url) { ENV['LYRICS_API'] + "SearchLyricText?lyricText=#{text}" }

  context 'sends request to song api' do
    before do
      stub_request(:any, url).to_return(body: file, status: 200)
      @response = described_class.new(text).call
    end

    it 'should response with a Song' do
      expect(@response.length).to eq(14)
    end

    context 'gets an empty response' do
      before do
        stub_request(:any, url).to_return(body: empty_file, status: 200)
        @response = described_class.new(text).call
      end

      it 'should return an empty array' do
        expect(@response).to be_empty
      end
    end
  end
end
