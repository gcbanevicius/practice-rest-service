class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # get /organizations
  def index
    @organizations = Organization.all

    respond_to do |format|
      #format.html # comment out this line to implement restful JSON api!
      format.json { render json: @organizations }
      format.any { render json: @organizations }
    end

  end

  # get /organizations/1
  def show
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if @organization
        format.json { render json: @organization }
        format.any { render json: @organization }
      else
        format.json { render json: @organization.errors }
        format.any { render json: @organization.errors }
      end
    end
  end

  # get /organizations/new
  def new
    @organization = Organization.new
  end

  # get /organizations/1/edit
  def edit
  end

  # post /organizations
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.json { render json: @organization, status: :created }
        format.any { render json: @organization, status: :created }
      else
        format.json { render json: @organization.errors, status: :unprocessable_entity }
        format.any { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # patch/put /organizations/1
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.json { render json: @organization, status: :ok }
        format.any { render json: @organization, status: :ok }
      else
        format.json { render json: @organization.errors, status: :unprocessable_entity }
        format.any { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # delete /organizations/1
  def destroy
    @organization.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.any{ head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name, :url)
    end
end
