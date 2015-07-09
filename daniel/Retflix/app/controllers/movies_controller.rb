class MoviesController < ApplicationController

  # GET /movies
  def index
    @movies = Movie.all
  end

  # GET /movies/:id
  def show
    get_movie
  end

  # GET /movies/:id/edit
  def edit
    get_movie
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # POST /movies
  def create
    @movie = Movie.new(white_listed_parameters)
    if @movie.save
      flash[:notice] = 'Movie saved'
      redirect_to(@movie)
    else
      render :new
    end
  end

  # PUT/PATCH /movies/:id
  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(white_listed_parameters)
      flash[:notice] = 'Movie saved'
      redirect_to movies_path
    else
      render :edit
    end
  end

  # # GET /movies/search/:query and direct to results
  # def search
  #   @movies = Movie.search(params[:query])
  # end

  # Get a movie form the database, redirect if error
  def get_movie
    begin
      @movie = Movie.find(params[:id])
    rescue
      redirect_to movies_path
    end
  end

  # White listed parameters
  def white_listed_parameters
    params
      .require(:movie)
      .permit(:title, :description, :year_released)
  end

end
