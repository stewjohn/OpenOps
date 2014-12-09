class AwsInternetGatewaysController < ApplicationController
  before_action :set_aws_internet_gateway, only: [:show, :edit, :update, :destroy]

  # GET /aws_internet_gateways
  # GET /aws_internet_gateways.json
  def index
    @aws_internet_gateways = AwsInternetGateway.all
  end

  # GET /aws_internet_gateways/1
  # GET /aws_internet_gateways/1.json
  def show
  end

  # GET /aws_internet_gateways/new
  def new
    @aws_internet_gateway = AwsInternetGateway.new
  end

  # GET /aws_internet_gateways/1/edit
  def edit
  end

  # POST /aws_internet_gateways
  # POST /aws_internet_gateways.json
  def create
    @aws_internet_gateway = AwsInternetGateway.new(aws_internet_gateway_params)

    respond_to do |format|
      if @aws_internet_gateway.save
        format.html { redirect_to @aws_internet_gateway, notice: 'Aws internet gateway was successfully created.' }
        format.json { render :show, status: :created, location: @aws_internet_gateway }
      else
        format.html { render :new }
        format.json { render json: @aws_internet_gateway.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_internet_gateways/1
  # PATCH/PUT /aws_internet_gateways/1.json
  def update
    respond_to do |format|
      if @aws_internet_gateway.update(aws_internet_gateway_params)
        format.html { redirect_to @aws_internet_gateway, notice: 'Aws internet gateway was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_internet_gateway }
      else
        format.html { render :edit }
        format.json { render json: @aws_internet_gateway.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_internet_gateways/1
  # DELETE /aws_internet_gateways/1.json
  def destroy
    @aws_internet_gateway.destroy
    respond_to do |format|
      format.html { redirect_to aws_internet_gateways_url, notice: 'Aws internet gateway was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_internet_gateway
      @aws_internet_gateway = AwsInternetGateway.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_internet_gateway_params
      params.require(:aws_internet_gateway).permit(:aws_account_id, :aws_region_id, :internet_gateway_id, :attachment_vpc_id, :attachment_state)
    end
end
