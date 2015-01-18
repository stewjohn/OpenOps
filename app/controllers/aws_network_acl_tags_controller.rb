class AwsNetworkAclTagsController < ApplicationController
  before_action :set_aws_network_acl_tag, only: [:show, :edit, :update, :destroy]

  # GET /aws_network_acl_tags
  # GET /aws_network_acl_tags.json
  def index
    @aws_network_acl_tags = AwsNetworkAclTag.all
  end

  # GET /aws_network_acl_tags/1
  # GET /aws_network_acl_tags/1.json
  def show
  end

  # GET /aws_network_acl_tags/new
  def new
    @aws_network_acl_tag = AwsNetworkAclTag.new
  end

  # GET /aws_network_acl_tags/1/edit
  def edit
  end

  # POST /aws_network_acl_tags
  # POST /aws_network_acl_tags.json
  def create
    @aws_network_acl_tag = AwsNetworkAclTag.new(aws_network_acl_tag_params)

    respond_to do |format|
      if @aws_network_acl_tag.save
        format.html { redirect_to @aws_network_acl_tag, notice: 'Aws network acl tag was successfully created.' }
        format.json { render :show, status: :created, location: @aws_network_acl_tag }
      else
        format.html { render :new }
        format.json { render json: @aws_network_acl_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_network_acl_tags/1
  # PATCH/PUT /aws_network_acl_tags/1.json
  def update
    respond_to do |format|
      if @aws_network_acl_tag.update(aws_network_acl_tag_params)
        format.html { redirect_to @aws_network_acl_tag, notice: 'Aws network acl tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_network_acl_tag }
      else
        format.html { render :edit }
        format.json { render json: @aws_network_acl_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_network_acl_tags/1
  # DELETE /aws_network_acl_tags/1.json
  def destroy
    @aws_network_acl_tag.destroy
    respond_to do |format|
      format.html { redirect_to aws_network_acl_tags_url, notice: 'Aws network acl tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_network_acl_tag
      @aws_network_acl_tag = AwsNetworkAclTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_network_acl_tag_params
      params.require(:aws_network_acl_tag).permit(:network_acl_id, :key, :value)
    end
end
