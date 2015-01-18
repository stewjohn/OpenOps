class AwsSecurityGroupEgressesController < ApplicationController
  before_action :set_aws_security_group_egress, only: [:show, :edit, :update, :destroy]

  # GET /aws_security_group_egresses
  # GET /aws_security_group_egresses.json
  def index
    @aws_security_group_egresses = AwsSecurityGroupEgress.all
  end

  # GET /aws_security_group_egresses/1
  # GET /aws_security_group_egresses/1.json
  def show
  end

  # GET /aws_security_group_egresses/new
  def new
    @aws_security_group_egress = AwsSecurityGroupEgress.new
  end

  # GET /aws_security_group_egresses/1/edit
  def edit
  end

  # POST /aws_security_group_egresses
  # POST /aws_security_group_egresses.json
  def create
    @aws_security_group_egress = AwsSecurityGroupEgress.new(aws_security_group_egress_params)

    respond_to do |format|
      if @aws_security_group_egress.save
        format.html { redirect_to @aws_security_group_egress, notice: 'Aws security group egress was successfully created.' }
        format.json { render :show, status: :created, location: @aws_security_group_egress }
      else
        format.html { render :new }
        format.json { render json: @aws_security_group_egress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_security_group_egresses/1
  # PATCH/PUT /aws_security_group_egresses/1.json
  def update
    respond_to do |format|
      if @aws_security_group_egress.update(aws_security_group_egress_params)
        format.html { redirect_to @aws_security_group_egress, notice: 'Aws security group egress was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_security_group_egress }
      else
        format.html { render :edit }
        format.json { render json: @aws_security_group_egress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_security_group_egresses/1
  # DELETE /aws_security_group_egresses/1.json
  def destroy
    @aws_security_group_egress.destroy
    respond_to do |format|
      format.html { redirect_to aws_security_group_egresses_url, notice: 'Aws security group egress was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_security_group_egress
      @aws_security_group_egress = AwsSecurityGroupEgress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_security_group_egress_params
      params.require(:aws_security_group_egress).permit(:security_group_id, :egress_id, :ip_protocol, :from_port, :to_port)
    end
end
