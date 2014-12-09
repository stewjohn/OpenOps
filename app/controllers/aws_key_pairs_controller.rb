class AwsKeyPairsController < ApplicationController
  before_action :set_aws_key_pair, only: [:show, :edit, :update, :destroy]

  # GET /aws_key_pairs
  # GET /aws_key_pairs.json
  def index
    @aws_key_pairs = AwsKeyPair.all
  end

  # GET /aws_key_pairs/1
  # GET /aws_key_pairs/1.json
  def show
  end

  # GET /aws_key_pairs/new
  def new
    @aws_key_pair = AwsKeyPair.new
  end

  # GET /aws_key_pairs/1/edit
  def edit
  end

  # POST /aws_key_pairs
  # POST /aws_key_pairs.json
  def create
    @aws_key_pair = AwsKeyPair.new(aws_key_pair_params)

    respond_to do |format|
      if @aws_key_pair.save
        format.html { redirect_to @aws_key_pair, notice: 'Aws key pair was successfully created.' }
        format.json { render :show, status: :created, location: @aws_key_pair }
      else
        format.html { render :new }
        format.json { render json: @aws_key_pair.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_key_pairs/1
  # PATCH/PUT /aws_key_pairs/1.json
  def update
    respond_to do |format|
      if @aws_key_pair.update(aws_key_pair_params)
        format.html { redirect_to @aws_key_pair, notice: 'Aws key pair was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_key_pair }
      else
        format.html { render :edit }
        format.json { render json: @aws_key_pair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_key_pairs/1
  # DELETE /aws_key_pairs/1.json
  def destroy
    @aws_key_pair.destroy
    respond_to do |format|
      format.html { redirect_to aws_key_pairs_url, notice: 'Aws key pair was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_key_pair
      @aws_key_pair = AwsKeyPair.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_key_pair_params
      params.require(:aws_key_pair).permit(:aws_account_id, :aws_region_id, :key_name, :key_fingerprint)
    end
end
