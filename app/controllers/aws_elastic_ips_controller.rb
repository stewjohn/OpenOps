class AwsElasticIpsController < ApplicationController
  before_action :set_aws_elastic_ip, only: [:show, :edit, :update, :destroy]

  # GET /aws_elastic_ips
  # GET /aws_elastic_ips.json
  def index
    @aws_elastic_ips = AwsElasticIp.all
  end

  # GET /aws_elastic_ips/1
  # GET /aws_elastic_ips/1.json
  def show
  end

  # GET /aws_elastic_ips/new
  def new
    @aws_elastic_ip = AwsElasticIp.new
  end

  # GET /aws_elastic_ips/1/edit
  def edit
  end

  # POST /aws_elastic_ips
  # POST /aws_elastic_ips.json
  def create
    @aws_elastic_ip = AwsElasticIp.new(aws_elastic_ip_params)

    respond_to do |format|
      if @aws_elastic_ip.save
        format.html { redirect_to @aws_elastic_ip, notice: 'Aws elastic ip was successfully created.' }
        format.json { render :show, status: :created, location: @aws_elastic_ip }
      else
        format.html { render :new }
        format.json { render json: @aws_elastic_ip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_elastic_ips/1
  # PATCH/PUT /aws_elastic_ips/1.json
  def update
    respond_to do |format|
      if @aws_elastic_ip.update(aws_elastic_ip_params)
        format.html { redirect_to @aws_elastic_ip, notice: 'Aws elastic ip was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_elastic_ip }
      else
        format.html { render :edit }
        format.json { render json: @aws_elastic_ip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_elastic_ips/1
  # DELETE /aws_elastic_ips/1.json
  def destroy
    @aws_elastic_ip.destroy
    respond_to do |format|
      format.html { redirect_to aws_elastic_ips_url, notice: 'Aws elastic ip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_elastic_ip
      @aws_elastic_ip = AwsElasticIp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_elastic_ip_params
      params.require(:aws_elastic_ip).permit(:aws_account_id, :aws_region_id, :instance_id, :public_ip, :allocation_id, :association_id, :domain, :network_interface_id, :network_interface_owner_id, :private_ip_address)
    end
end
