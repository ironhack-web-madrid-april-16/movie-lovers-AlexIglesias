require_relative('../lib/movies.rb')
require 'imdb'

describe Movies do
  before :each do
    @movies = Movies.new
    @movies.limit_to_nine('james')
  end

  describe 'limited search to nine results' do
    it 'returns the length of the results array' do
      expect(@movies.results.length).to eq(9)
    end
  end

  describe 'only show movies with posters' do
    it 'gets 9 movies with posters' do
      result = @movies.movies_with_posters
      expect(result.length).to eq(9)
    end
  end
end
