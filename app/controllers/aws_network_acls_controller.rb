class AwsNetworkAclsController < ApplicationController
  before_action :set_aws_network_acl, only: [:show, :edit, :update, :destroy]

  # GET /aws_network_acls
  # GET /aws_network_acls.json
  def index
    @aws_network_acls = AwsNetworkAcl.all
  end

  # GET /aws_network_acls/1
  # GET /aws_network_acls/1.json
  def show
  end

  # GET /aws_network_acls/new
  def new
    @aws_network_acl = AwsNetworkAcl.new
  end

  # GET /aws_network_acls/1/edit
  def edit
  end

  # POST /aws_network_acls
  # POST /aws_network_acls.json
  def create
    @aws_network_acl = AwsNetworkAcl.new(aws_network_acl_params)

    respond_to do |format|
      if @aws_network_acl.save
        format.html { redirect_to @aws_network_acl, notice: 'Aws network acl was successfully created.' }
        format.json { render :show, status: :created, location: @aws_network_acl }
      else
        format.html { render :new }
        format.json { render json: @aws_network_acl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_network_acls/1
  # PATCH/PUT /aws_network_acls/1.json
  def update
    respond_to do |format|
      if @aws_network_acl.update(aws_network_acl_params)
        format.html { redirect_to @aws_network_acl, notice: 'Aws network acl was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_network_acl }
      else
        format.html { render :edit }
        format.json { render json: @aws_network_acl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_network_acls/1
  # DELETE /aws_network_acls/1.json
  def destroy
    @aws_network_acl.destroy
    respond_to do |format|
      format.html { redirect_to aws_network_acls_url, notice: 'Aws network acl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_network_acl
      @aws_network_acl = AwsNetworkAcl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_network_acl_params
      params.require(:aws_network_acl).permit(:aws_account_id, :aws_region_id, :network_acl_id, :association_id, :association_acl_id, :association_subnet_id)
    end
end
