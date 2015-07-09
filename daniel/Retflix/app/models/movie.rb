class Movie < ActiveRecord::Base

  validates_presence_of :title, :description, :year_released
  validates :year_released, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.search(query)
    @movie = Movie.where("year_released == ? OR title LIKE ?", "#{query}", "#{query}")
    # TODO Find Model level errors 
    # if @movie.empty?
    #   flash[:notice] = 'Sorry no Movies found'
    # end
  end

end
