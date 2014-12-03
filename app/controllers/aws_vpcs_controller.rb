class AwsVpcsController < ApplicationController
  before_action :set_aws_vpc, only: [:show, :edit, :update, :destroy]

  # GET /aws_vpcs
  # GET /aws_vpcs.json
  def index
    @aws_vpcs = AwsVpc.all
  end

  # GET /aws_vpcs/1
  # GET /aws_vpcs/1.json
  def show
  end

  # GET /aws_vpcs/new
  def new
    @aws_vpc = AwsVpc.new
  end

  # GET /aws_vpcs/1/edit
  def edit
  end

  # POST /aws_vpcs
  # POST /aws_vpcs.json
  def create
    @aws_vpc = AwsVpc.new(aws_vpc_params)

    respond_to do |format|
      if @aws_vpc.save
        format.html { redirect_to @aws_vpc, notice: 'Aws vpc was successfully created.' }
        format.json { render :show, status: :created, location: @aws_vpc }
      else
        format.html { render :new }
        format.json { render json: @aws_vpc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_vpcs/1
  # PATCH/PUT /aws_vpcs/1.json
  def update
    respond_to do |format|
      if @aws_vpc.update(aws_vpc_params)
        format.html { redirect_to @aws_vpc, notice: 'Aws vpc was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_vpc }
      else
        format.html { render :edit }
        format.json { render json: @aws_vpc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_vpcs/1
  # DELETE /aws_vpcs/1.json
  def destroy
    @aws_vpc.destroy
    respond_to do |format|
      format.html { redirect_to aws_vpcs_url, notice: 'Aws vpc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_vpc
      @aws_vpc = AwsVpc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_vpc_params
      params.require(:aws_vpc).permit(:vpc_id, :state, :cidr_block, :dhcp_options_id, :instance_default, :is_default)
    end
end
