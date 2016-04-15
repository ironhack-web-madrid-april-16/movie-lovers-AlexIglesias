require 'sinatra'
require 'sinatra/reloader' if development?
require 'imdb'
require_relative('lib/movies.rb')

movies = Movies.new

get '/' do
  erb(:search)
end

post '/results' do
  @search_string = params[:search]
  movies.limit_to_nine(@search_string)

  @list = movies.movies_with_posters
  @list_length = movies.movies_with_posters.length

  @random_movie = movies.random_release_date
  @release_date = @random_movie.year
  erb(:results)
end

post '/correct_answer' do
  erb(:correct_answer)
end

post '/wrong_answer' do
  erb(:wrong_answer)
end
