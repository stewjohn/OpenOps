class AwsInternetGatewayTagsController < ApplicationController
  before_action :set_aws_internet_gateway_tag, only: [:show, :edit, :update, :destroy]

  # GET /aws_internet_gateway_tags
  # GET /aws_internet_gateway_tags.json
  def index
    @aws_internet_gateway_tags = AwsInternetGatewayTag.all
  end

  # GET /aws_internet_gateway_tags/1
  # GET /aws_internet_gateway_tags/1.json
  def show
  end

  # GET /aws_internet_gateway_tags/new
  def new
    @aws_internet_gateway_tag = AwsInternetGatewayTag.new
  end

  # GET /aws_internet_gateway_tags/1/edit
  def edit
  end

  # POST /aws_internet_gateway_tags
  # POST /aws_internet_gateway_tags.json
  def create
    @aws_internet_gateway_tag = AwsInternetGatewayTag.new(aws_internet_gateway_tag_params)

    respond_to do |format|
      if @aws_internet_gateway_tag.save
        format.html { redirect_to @aws_internet_gateway_tag, notice: 'Aws internet gateway tag was successfully created.' }
        format.json { render :show, status: :created, location: @aws_internet_gateway_tag }
      else
        format.html { render :new }
        format.json { render json: @aws_internet_gateway_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_internet_gateway_tags/1
  # PATCH/PUT /aws_internet_gateway_tags/1.json
  def update
    respond_to do |format|
      if @aws_internet_gateway_tag.update(aws_internet_gateway_tag_params)
        format.html { redirect_to @aws_internet_gateway_tag, notice: 'Aws internet gateway tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_internet_gateway_tag }
      else
        format.html { render :edit }
        format.json { render json: @aws_internet_gateway_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_internet_gateway_tags/1
  # DELETE /aws_internet_gateway_tags/1.json
  def destroy
    @aws_internet_gateway_tag.destroy
    respond_to do |format|
      format.html { redirect_to aws_internet_gateway_tags_url, notice: 'Aws internet gateway tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_internet_gateway_tag
      @aws_internet_gateway_tag = AwsInternetGatewayTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_internet_gateway_tag_params
      params.require(:aws_internet_gateway_tag).permit(:internet_gateway_id, :key, :value)
    end
end
