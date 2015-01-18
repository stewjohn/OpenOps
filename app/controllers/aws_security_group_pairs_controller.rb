class AwsSecurityGroupPairsController < ApplicationController
  before_action :set_aws_security_group_pair, only: [:show, :edit, :update, :destroy]

  # GET /aws_security_group_pairs
  # GET /aws_security_group_pairs.json
  def index
    @aws_security_group_pairs = AwsSecurityGroupPair.all
  end

  # GET /aws_security_group_pairs/1
  # GET /aws_security_group_pairs/1.json
  def show
  end

  # GET /aws_security_group_pairs/new
  def new
    @aws_security_group_pair = AwsSecurityGroupPair.new
  end

  # GET /aws_security_group_pairs/1/edit
  def edit
  end

  # POST /aws_security_group_pairs
  # POST /aws_security_group_pairs.json
  def create
    @aws_security_group_pair = AwsSecurityGroupPair.new(aws_security_group_pair_params)

    respond_to do |format|
      if @aws_security_group_pair.save
        format.html { redirect_to @aws_security_group_pair, notice: 'Aws security group pair was successfully created.' }
        format.json { render :show, status: :created, location: @aws_security_group_pair }
      else
        format.html { render :new }
        format.json { render json: @aws_security_group_pair.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_security_group_pairs/1
  # PATCH/PUT /aws_security_group_pairs/1.json
  def update
    respond_to do |format|
      if @aws_security_group_pair.update(aws_security_group_pair_params)
        format.html { redirect_to @aws_security_group_pair, notice: 'Aws security group pair was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_security_group_pair }
      else
        format.html { render :edit }
        format.json { render json: @aws_security_group_pair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_security_group_pairs/1
  # DELETE /aws_security_group_pairs/1.json
  def destroy
    @aws_security_group_pair.destroy
    respond_to do |format|
      format.html { redirect_to aws_security_group_pairs_url, notice: 'Aws security group pair was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_security_group_pair
      @aws_security_group_pair = AwsSecurityGroupPair.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_security_group_pair_params
      params.require(:aws_security_group_pair).permit(:security_group_id, :permission_set_id, :user_id, :group_name, :group_id)
    end
end
