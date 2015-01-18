class AwsSecurityGroupTagsController < ApplicationController
  before_action :set_aws_security_group_tag, only: [:show, :edit, :update, :destroy]

  # GET /aws_security_group_tags
  # GET /aws_security_group_tags.json
  def index
    @aws_security_group_tags = AwsSecurityGroupTag.all
  end

  # GET /aws_security_group_tags/1
  # GET /aws_security_group_tags/1.json
  def show
  end

  # GET /aws_security_group_tags/new
  def new
    @aws_security_group_tag = AwsSecurityGroupTag.new
  end

  # GET /aws_security_group_tags/1/edit
  def edit
  end

  # POST /aws_security_group_tags
  # POST /aws_security_group_tags.json
  def create
    @aws_security_group_tag = AwsSecurityGroupTag.new(aws_security_group_tag_params)

    respond_to do |format|
      if @aws_security_group_tag.save
        format.html { redirect_to @aws_security_group_tag, notice: 'Aws security group tag was successfully created.' }
        format.json { render :show, status: :created, location: @aws_security_group_tag }
      else
        format.html { render :new }
        format.json { render json: @aws_security_group_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_security_group_tags/1
  # PATCH/PUT /aws_security_group_tags/1.json
  def update
    respond_to do |format|
      if @aws_security_group_tag.update(aws_security_group_tag_params)
        format.html { redirect_to @aws_security_group_tag, notice: 'Aws security group tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_security_group_tag }
      else
        format.html { render :edit }
        format.json { render json: @aws_security_group_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_security_group_tags/1
  # DELETE /aws_security_group_tags/1.json
  def destroy
    @aws_security_group_tag.destroy
    respond_to do |format|
      format.html { redirect_to aws_security_group_tags_url, notice: 'Aws security group tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_security_group_tag
      @aws_security_group_tag = AwsSecurityGroupTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_security_group_tag_params
      params.require(:aws_security_group_tag).permit(:security_group_id, :key, :value)
    end
end
