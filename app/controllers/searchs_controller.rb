class SearchsController < ApplicationController
  def new
  end

  def create
    # only searching with department for now for simplicity
    # need to flesh this out with more complexity
    @professors = Professor.where("department = ?", params[:search][:department])
    # @professors = @professors.select

    if @professors.count >= 1
      render 'index'  # try redirect_to if render doesn't work
    else
      flash.now[:danger] = 'No professors match your criteria!'
      render 'new'
    end
  end

  def index
  end

end
