class AwsSubnetsController < ApplicationController
  before_action :set_aws_subnet, only: [:show, :edit, :update, :destroy]

  # GET /aws_subnets
  # GET /aws_subnets.json
  def index
    @aws_subnets = AwsSubnet.all
  end

  # GET /aws_subnets/1
  # GET /aws_subnets/1.json
  def show
  end

  # GET /aws_subnets/new
  def new
    @aws_subnet = AwsSubnet.new
  end

  # GET /aws_subnets/1/edit
  def edit
  end

  # POST /aws_subnets
  # POST /aws_subnets.json
  def create
    @aws_subnet = AwsSubnet.new(aws_subnet_params)

    respond_to do |format|
      if @aws_subnet.save
        format.html { redirect_to @aws_subnet, notice: 'Aws subnet was successfully created.' }
        format.json { render :show, status: :created, location: @aws_subnet }
      else
        format.html { render :new }
        format.json { render json: @aws_subnet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_subnets/1
  # PATCH/PUT /aws_subnets/1.json
  def update
    respond_to do |format|
      if @aws_subnet.update(aws_subnet_params)
        format.html { redirect_to @aws_subnet, notice: 'Aws subnet was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_subnet }
      else
        format.html { render :edit }
        format.json { render json: @aws_subnet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_subnets/1
  # DELETE /aws_subnets/1.json
  def destroy
    @aws_subnet.destroy
    respond_to do |format|
      format.html { redirect_to aws_subnets_url, notice: 'Aws subnet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_subnet
      @aws_subnet = AwsSubnet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_subnet_params
      params.require(:aws_subnet).permit(:subnet_id, :state, :vpc_id, :cidr_block, :available_ip_address_count, :availability_zone, :default_for_az, :map_public_ip_on_launch)
    end
end
