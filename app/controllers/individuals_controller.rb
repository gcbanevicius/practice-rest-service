class IndividualsController < ApplicationController
  before_action :set_individual, only: [:show, :edit, :update, :destroy]

  # GET /individuals
  def index
    @individuals = Individual.all
  end

  # GET /individuals/1
  def show
  end

  # GET /individuals/new
  def new
    @individual = Individual.new
  end

  # GET /individuals/1/edit
  def edit
  end

  # POST /individuals
  def create
    @individual = Individual.new(individual_params)

    respond_to do |format|
      if @individual.save
        format.json { render :show, status: :created, location: @individual }
      else
        format.json { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /individuals/1
  def update
    respond_to do |format|
      if @individual.update(individual_params)
        format.json { render :show, status: :ok, location: @individual }
      else
        format.json { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /individuals/1
  def destroy
    @individual.destroy
    respond_to do |format|
      format.json { head :no_content }
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
