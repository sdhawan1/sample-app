class ProfessorsController < ApplicationController
  
  def show
    @professor = Professor.find(params[:id])
    @reviews = @professor.reviews.paginate(page: params[:page])
  end

  def new
    @professor = Professor.new
  end
  
  def create
    @professor = Professor.new(professor_params)
    if @professor.save
      flash[:success] = "Advisor added!"
      redirect_to @professor
    else
      render 'new'
    end
  end

  def index
    if params[:query].present?
      @professors = Professor.search(params[:query], 
                                     fields: [:first_name, :last_name, :netid, :department],
                                     page: params[:page])
    else
      @professors = Professor.all.page params[:page]
    end
  end

  def autocomplete
    render json: Professor.search(params[:query],
                 autocomplete: true,
                 fields: [:first_name, :last_name, :netid, :department],
                 limit: 10).map { |professor|
                   professor.first_name + " " + professor.last_name + " " + professor.netid + " " + professor.department
                 }
  end


  private

    def professor_params
      params.require(:professor).permit(:first_name, :last_name, :netid,
                                   :department)
    end

end
