class JobCastsController < ApplicationController
  before_action :set_job_cast, only: [:show, :edit, :update, :destroy]

  # GET /job_casts
  # GET /job_casts.json
  def index
    @job_casts = JobCast.all
  end

  # GET /job_casts/1
  # GET /job_casts/1.json
  def show
  end

  # GET /job_casts/new
  def new
    @job_cast = JobCast.new
  end

  # GET /job_casts/1/edit
  def edit
  end

  # POST /job_casts
  # POST /job_casts.json
  def create
    @job_cast = JobCast.new(job_cast_params)

    respond_to do |format|
      if @job_cast.save
        format.html { redirect_to @job_cast, notice: 'Job cast was successfully created.' }
        format.json { render :show, status: :created, location: @job_cast }
      else
        format.html { render :new }
        format.json { render json: @job_cast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_casts/1
  # PATCH/PUT /job_casts/1.json
  def update
    respond_to do |format|
      if @job_cast.update(job_cast_params)
        format.html { redirect_to @job_cast, notice: 'Job cast was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_cast }
      else
        format.html { render :edit }
        format.json { render json: @job_cast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_casts/1
  # DELETE /job_casts/1.json
  def destroy
    @job_cast.destroy
    respond_to do |format|
      format.html { redirect_to job_casts_url, notice: 'Job cast was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_cast
      @job_cast = JobCast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_cast_params
      params.require(:job_cast).permit(:title, :description, :compensation_min, :compensation_max, :skills, :city, :state, :postal_code, :country_code)
    end
end
