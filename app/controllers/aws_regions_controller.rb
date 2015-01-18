class AwsRegionsController < ApplicationController
  before_action :set_aws_region, only: [:show, :edit, :update, :destroy]

  # GET /aws_regions
  # GET /aws_regions.json
  def index
    @aws_regions = AwsRegion.all
  end

  # GET /aws_regions/1
  # GET /aws_regions/1.json
  def show
  end

  # GET /aws_regions/new
  def new
    @aws_region = AwsRegion.new
  end

  # GET /aws_regions/1/edit
  def edit
  end

  # POST /aws_regions
  # POST /aws_regions.json
  def create
    @aws_region = AwsRegion.new(aws_region_params)

    respond_to do |format|
      if @aws_region.save
        format.html { redirect_to @aws_region, notice: 'Aws region was successfully created.' }
        format.json { render :show, status: :created, location: @aws_region }
      else
        format.html { render :new }
        format.json { render json: @aws_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_regions/1
  # PATCH/PUT /aws_regions/1.json
  def update
    respond_to do |format|
      if @aws_region.update(aws_region_params)
        format.html { redirect_to @aws_region, notice: 'Aws region was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_region }
      else
        format.html { render :edit }
        format.json { render json: @aws_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_regions/1
  # DELETE /aws_regions/1.json
  def destroy
    @aws_region.destroy
    respond_to do |format|
      format.html { redirect_to aws_regions_url, notice: 'Aws region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_region
      @aws_region = AwsRegion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_region_params
      params.require(:aws_region).permit(:name)
    end
end
