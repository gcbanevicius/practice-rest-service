class JobCastsController < ApplicationController
  before_action :set_job_cast, only: [:show, :edit, :update, :destroy]

  # GET /job_casts
  def index
    @job_casts = JobCast.all

    respond_to do |format|
      #format.html # comment out this line to implement RESTful JSON API!
      format.json { render json: @job_casts }
      format.any { render json: @job_casts }
    end

  end

  # GET /job_casts/1
  def show
    @job_cast = JobCast.find(params[:id])

    respond_to do |format|
      if @job_cast
        format.json { render json: @job_cast }
        format.any { render json: @job_cast }
      else
        format.json { render json: @job_cast.errors }
        format.any { render json: @job_cast.errors }
      end
    end
  end

  # GET /job_casts/new
  def new
    @job_cast = JobCast.new
  end

  # GET /job_casts/1/edit
  def edit
  end

  # POST /job_casts
  def create
    @job_cast = JobCast.new(job_cast_params)

    respond_to do |format|
      if @job_cast.save
        format.json { render json: @job_cast, status: :created }
        format.any { render json: @job_cast, status: :created }
      else
        format.json { render json: @job_cast.errors, status: :unprocessable_entity }
        format.any { render json: @job_cast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_casts/1
  def update
    respond_to do |format|
      if @job_cast.update(job_cast_params)
        format.json { render json: @job_cast, status: :ok }
        format.any { render json: @job_cast, status: :ok }
      else
        format.json { render json: @job_cast.errors, status: :unprocessable_entity }
        format.any { render json: @job_cast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_casts/1
  def destroy
    @job_cast.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.any{ head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_cast
      @job_cast = JobCast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_cast_params
      params.require(:job_cast).permit(:organization_id, :title, :description, :compensation_min, :compensation_max, :skills, :city, :state, :postal_code, :country_code)
    end
end
