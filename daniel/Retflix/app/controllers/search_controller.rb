class SearchController < ApplicationController
  def index
    @movies = Movie.search(params[:query])
  end
end