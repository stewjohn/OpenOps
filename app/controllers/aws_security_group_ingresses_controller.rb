class AwsSecurityGroupIngressesController < ApplicationController
  before_action :set_aws_security_group_ingress, only: [:show, :edit, :update, :destroy]

  # GET /aws_security_group_ingresses
  # GET /aws_security_group_ingresses.json
  def index
    @aws_security_group_ingresses = AwsSecurityGroupIngress.all
  end

  # GET /aws_security_group_ingresses/1
  # GET /aws_security_group_ingresses/1.json
  def show
  end

  # GET /aws_security_group_ingresses/new
  def new
    @aws_security_group_ingress = AwsSecurityGroupIngress.new
  end

  # GET /aws_security_group_ingresses/1/edit
  def edit
  end

  # POST /aws_security_group_ingresses
  # POST /aws_security_group_ingresses.json
  def create
    @aws_security_group_ingress = AwsSecurityGroupIngress.new(aws_security_group_ingress_params)

    respond_to do |format|
      if @aws_security_group_ingress.save
        format.html { redirect_to @aws_security_group_ingress, notice: 'Aws security group ingress was successfully created.' }
        format.json { render :show, status: :created, location: @aws_security_group_ingress }
      else
        format.html { render :new }
        format.json { render json: @aws_security_group_ingress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_security_group_ingresses/1
  # PATCH/PUT /aws_security_group_ingresses/1.json
  def update
    respond_to do |format|
      if @aws_security_group_ingress.update(aws_security_group_ingress_params)
        format.html { redirect_to @aws_security_group_ingress, notice: 'Aws security group ingress was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_security_group_ingress }
      else
        format.html { render :edit }
        format.json { render json: @aws_security_group_ingress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_security_group_ingresses/1
  # DELETE /aws_security_group_ingresses/1.json
  def destroy
    @aws_security_group_ingress.destroy
    respond_to do |format|
      format.html { redirect_to aws_security_group_ingresses_url, notice: 'Aws security group ingress was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_security_group_ingress
      @aws_security_group_ingress = AwsSecurityGroupIngress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_security_group_ingress_params
      params.require(:aws_security_group_ingress).permit(:security_group_id, :ingress_id, :ip_protocol, :from_port, :to_port)
    end
end
