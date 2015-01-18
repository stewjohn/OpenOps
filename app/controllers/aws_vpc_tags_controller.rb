class AwsVpcTagsController < ApplicationController
  before_action :set_aws_vpc_tag, only: [:show, :edit, :update, :destroy]

  # GET /aws_vpc_tags
  # GET /aws_vpc_tags.json
  def index
    @aws_vpc_tags = AwsVpcTag.all
  end

  # GET /aws_vpc_tags/1
  # GET /aws_vpc_tags/1.json
  def show
  end

  # GET /aws_vpc_tags/new
  def new
    @aws_vpc_tag = AwsVpcTag.new
  end

  # GET /aws_vpc_tags/1/edit
  def edit
  end

  # POST /aws_vpc_tags
  # POST /aws_vpc_tags.json
  def create
    @aws_vpc_tag = AwsVpcTag.new(aws_vpc_tag_params)

    respond_to do |format|
      if @aws_vpc_tag.save
        format.html { redirect_to @aws_vpc_tag, notice: 'Aws vpc tag was successfully created.' }
        format.json { render :show, status: :created, location: @aws_vpc_tag }
      else
        format.html { render :new }
        format.json { render json: @aws_vpc_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_vpc_tags/1
  # PATCH/PUT /aws_vpc_tags/1.json
  def update
    respond_to do |format|
      if @aws_vpc_tag.update(aws_vpc_tag_params)
        format.html { redirect_to @aws_vpc_tag, notice: 'Aws vpc tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_vpc_tag }
      else
        format.html { render :edit }
        format.json { render json: @aws_vpc_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_vpc_tags/1
  # DELETE /aws_vpc_tags/1.json
  def destroy
    @aws_vpc_tag.destroy
    respond_to do |format|
      format.html { redirect_to aws_vpc_tags_url, notice: 'Aws vpc tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_vpc_tag
      @aws_vpc_tag = AwsVpcTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_vpc_tag_params
      params.require(:aws_vpc_tag).permit(:aws_vpc_id, :name, :value)
    end
end
