class AwsRouteTableTagsController < ApplicationController
  before_action :set_aws_route_table_tag, only: [:show, :edit, :update, :destroy]

  # GET /aws_route_table_tags
  # GET /aws_route_table_tags.json
  def index
    @aws_route_table_tags = AwsRouteTableTag.all
  end

  # GET /aws_route_table_tags/1
  # GET /aws_route_table_tags/1.json
  def show
  end

  # GET /aws_route_table_tags/new
  def new
    @aws_route_table_tag = AwsRouteTableTag.new
  end

  # GET /aws_route_table_tags/1/edit
  def edit
  end

  # POST /aws_route_table_tags
  # POST /aws_route_table_tags.json
  def create
    @aws_route_table_tag = AwsRouteTableTag.new(aws_route_table_tag_params)

    respond_to do |format|
      if @aws_route_table_tag.save
        format.html { redirect_to @aws_route_table_tag, notice: 'Aws route table tag was successfully created.' }
        format.json { render :show, status: :created, location: @aws_route_table_tag }
      else
        format.html { render :new }
        format.json { render json: @aws_route_table_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_route_table_tags/1
  # PATCH/PUT /aws_route_table_tags/1.json
  def update
    respond_to do |format|
      if @aws_route_table_tag.update(aws_route_table_tag_params)
        format.html { redirect_to @aws_route_table_tag, notice: 'Aws route table tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_route_table_tag }
      else
        format.html { render :edit }
        format.json { render json: @aws_route_table_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_route_table_tags/1
  # DELETE /aws_route_table_tags/1.json
  def destroy
    @aws_route_table_tag.destroy
    respond_to do |format|
      format.html { redirect_to aws_route_table_tags_url, notice: 'Aws route table tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_route_table_tag
      @aws_route_table_tag = AwsRouteTableTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_route_table_tag_params
      params.require(:aws_route_table_tag).permit(:route_table_id, :key, :value)
    end
end
