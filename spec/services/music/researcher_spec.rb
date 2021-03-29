require 'rails_helper'

describe Music::ResearcherService do
  let!(:artist) { 'phrase' }
  let!(:song) { 'In the End' }
  let!(:file) { File.read('spec/support/files/music/researcher_response.xml') }
  let!(:empty_file) { File.read('spec/support/files/music/empty_response.xml') }
  let!(:url) { ENV['LYRICS_API'] + "SearchLyric?artist=#{artist}&song=#{song}" }

  context 'sends request to song api' do
    before do
      stub_request(:any, url).to_return(body: file, status: 200)
      @response = described_class.new(artist, song).call
    end

    it 'should response with a Song' do
      expect(@response.length).to eq(14)
    end

    context 'gets an empty response' do
      before do
        stub_request(:any, url).to_return(body: empty_file, status: 200)
        @response = described_class.new(artist, song).call
      end

      it 'should return an empty array' do
        expect(@response).to be_empty
      end
    end
  end
end
