require 'rails_helper'

describe Music::SongService do
  let!(:artist) { 'phrase' }
  let!(:song) { 'In the End' }
  let!(:file) { File.read('spec/support/files/music/song_response.xml') }
  let!(:empty_file) { File.read('spec/support/files/music/empty_response.xml') }
  let!(:url) { ENV['LYRICS_API'] + "SearchLyricDirect?artist=#{artist}&song=#{song}" }

  context 'sends request to song api' do
    before do
      stub_request(:any, url).to_return(body: file, status: 200)
      @response = described_class.new(artist, song).call
    end

    it 'should response with a Song' do
      expect(@response.title).to eq(song)
    end

    context 'gets an empty response' do
      before do
        stub_request(:any, url).to_return(body: empty_file, status: 200)
        @response = described_class.new(artist, song).call
      end

      it 'should return nil' do
        expect(@response).to be_nil
      end
    end
  end
end
