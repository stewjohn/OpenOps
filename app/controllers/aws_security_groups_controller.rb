class AwsSecurityGroupsController < ApplicationController
  before_action :set_aws_security_group, only: [:show, :edit, :update, :destroy]

  # GET /aws_security_groups
  # GET /aws_security_groups.json
  def index
    @aws_security_groups = AwsSecurityGroup.all
  end

  # GET /aws_security_groups/1
  # GET /aws_security_groups/1.json
  def show
  end

  # GET /aws_security_groups/new
  def new
    @aws_security_group = AwsSecurityGroup.new
  end

  # GET /aws_security_groups/1/edit
  def edit
  end

  # POST /aws_security_groups
  # POST /aws_security_groups.json
  def create
    @aws_security_group = AwsSecurityGroup.new(aws_security_group_params)

    respond_to do |format|
      if @aws_security_group.save
        format.html { redirect_to @aws_security_group, notice: 'Aws security group was successfully created.' }
        format.json { render :show, status: :created, location: @aws_security_group }
      else
        format.html { render :new }
        format.json { render json: @aws_security_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_security_groups/1
  # PATCH/PUT /aws_security_groups/1.json
  def update
    respond_to do |format|
      if @aws_security_group.update(aws_security_group_params)
        format.html { redirect_to @aws_security_group, notice: 'Aws security group was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_security_group }
      else
        format.html { render :edit }
        format.json { render json: @aws_security_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_security_groups/1
  # DELETE /aws_security_groups/1.json
  def destroy
    @aws_security_group.destroy
    respond_to do |format|
      format.html { redirect_to aws_security_groups_url, notice: 'Aws security group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_security_group
      @aws_security_group = AwsSecurityGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_security_group_params
      params.require(:aws_security_group).permit(:owner_id, :group_name, :group_id, :description)
    end
end
