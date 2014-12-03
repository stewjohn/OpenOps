class AwsAzsController < ApplicationController
  before_action :set_aws_az, only: [:show, :edit, :update, :destroy]

  # GET /aws_azs
  # GET /aws_azs.json
  def index
    @aws_azs = AwsAz.all
  end

  # GET /aws_azs/1
  # GET /aws_azs/1.json
  def show
  end

  # GET /aws_azs/new
  def new
    @aws_az = AwsAz.new
  end

  # GET /aws_azs/1/edit
  def edit
  end

  # POST /aws_azs
  # POST /aws_azs.json
  def create
    @aws_az = AwsAz.new(aws_az_params)

    respond_to do |format|
      if @aws_az.save
        format.html { redirect_to @aws_az, notice: 'Aws az was successfully created.' }
        format.json { render :show, status: :created, location: @aws_az }
      else
        format.html { render :new }
        format.json { render json: @aws_az.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_azs/1
  # PATCH/PUT /aws_azs/1.json
  def update
    respond_to do |format|
      if @aws_az.update(aws_az_params)
        format.html { redirect_to @aws_az, notice: 'Aws az was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_az }
      else
        format.html { render :edit }
        format.json { render json: @aws_az.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_azs/1
  # DELETE /aws_azs/1.json
  def destroy
    @aws_az.destroy
    respond_to do |format|
      format.html { redirect_to aws_azs_url, notice: 'Aws az was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_az
      @aws_az = AwsAz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_az_params
      params.require(:aws_az).permit(:aws_region_id, :name)
    end
end
