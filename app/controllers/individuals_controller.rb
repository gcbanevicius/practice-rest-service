class IndividualsController < ApplicationController
  before_action :set_individual, only: [:show, :edit, :update, :destroy]

  # get /individuals
  def index
    @individuals = Individual.all

    respond_to do |format|
      format.html # comment out this line to implement restful api!
      format.json { render json: @individuals }
      format.any { render json: @individuals }
    end

  end

  # get /individuals/1
  def show
    @individual = Individual.find(params[:id])

    respond_to do |format|
      if @individual
        format.json { render json: @individual }
        format.any { render json: @individual }
      else
        format.json { render json: @individual.errors }
        format.any { render json: @individual.errors }
      end
    end
  end

  # get /individuals/new
  def new
    @individual = Individual.new
  end

  # get /individuals/1/edit
  def edit
  end

  # post /individuals
  def create
    @individual = Individual.new(individual_params)

    respond_to do |format|
      if @individual.save
        format.json { render json: @individual, status: :created }
        format.any { render json: @individual, status: :created }
      else
        format.json { render json: @individual.errors, status: :unprocessable_entity }
        format.any { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # patch/put /individuals/1
  def update
    @job_cast = JobCast.where(:id => params[:job_cast_id])
    
    respond_to do |format|
      if @individual.update(individual_params)
        format.json { render json: @individual, status: :ok }
        format.any { render json: @individual, status: :ok }
      else
        format.json { render json: @individual.errors, status: :unprocessable_entity }
        format.any { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # delete /individuals/1
  def destroy
    @individual.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.any{ head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_individual
      @individual = Individual.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def individual_params
      params.require(:individual).permit(:first_name, :last_name, :email, :password)
    end
end
