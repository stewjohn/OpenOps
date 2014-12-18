class AwsSecurityGroupRangesController < ApplicationController
  before_action :set_aws_security_group_range, only: [:show, :edit, :update, :destroy]

  # GET /aws_security_group_ranges
  # GET /aws_security_group_ranges.json
  def index
    @aws_security_group_ranges = AwsSecurityGroupRange.all
  end

  # GET /aws_security_group_ranges/1
  # GET /aws_security_group_ranges/1.json
  def show
  end

  # GET /aws_security_group_ranges/new
  def new
    @aws_security_group_range = AwsSecurityGroupRange.new
  end

  # GET /aws_security_group_ranges/1/edit
  def edit
  end

  # POST /aws_security_group_ranges
  # POST /aws_security_group_ranges.json
  def create
    @aws_security_group_range = AwsSecurityGroupRange.new(aws_security_group_range_params)

    respond_to do |format|
      if @aws_security_group_range.save
        format.html { redirect_to @aws_security_group_range, notice: 'Aws security group range was successfully created.' }
        format.json { render :show, status: :created, location: @aws_security_group_range }
      else
        format.html { render :new }
        format.json { render json: @aws_security_group_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_security_group_ranges/1
  # PATCH/PUT /aws_security_group_ranges/1.json
  def update
    respond_to do |format|
      if @aws_security_group_range.update(aws_security_group_range_params)
        format.html { redirect_to @aws_security_group_range, notice: 'Aws security group range was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_security_group_range }
      else
        format.html { render :edit }
        format.json { render json: @aws_security_group_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_security_group_ranges/1
  # DELETE /aws_security_group_ranges/1.json
  def destroy
    @aws_security_group_range.destroy
    respond_to do |format|
      format.html { redirect_to aws_security_group_ranges_url, notice: 'Aws security group range was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_security_group_range
      @aws_security_group_range = AwsSecurityGroupRange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_security_group_range_params
      params.require(:aws_security_group_range).permit(:security_group_id, :permission_set_id, :cidr_ip)
    end
end
