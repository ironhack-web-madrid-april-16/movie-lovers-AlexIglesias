require 'imdb'
# class Movies
class Movies
  attr_reader :results, :movies_with_posters
  def limit_to_nine(string)
    search = Imdb::Search.new(string)
    @results = search.movies.take(9)
  end

  def movies_with_posters
    @movies_with_posters = []
    @results.each do |result|
      @movies_with_posters << result if !result.poster.nil? && !result.year.nil?
    end

    @movies_with_posters.pop while @movies_with_posters.size > 9
    @movies_with_posters
  end

  def random_release_date
    @random_movie = @movies_with_posters.sample
    @random_movie
  end
end
