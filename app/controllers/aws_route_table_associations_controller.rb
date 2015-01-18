class AwsRouteTableAssociationsController < ApplicationController
  before_action :set_aws_route_table_association, only: [:show, :edit, :update, :destroy]

  # GET /aws_route_table_associations
  # GET /aws_route_table_associations.json
  def index
    @aws_route_table_associations = AwsRouteTableAssociation.all
  end

  # GET /aws_route_table_associations/1
  # GET /aws_route_table_associations/1.json
  def show
  end

  # GET /aws_route_table_associations/new
  def new
    @aws_route_table_association = AwsRouteTableAssociation.new
  end

  # GET /aws_route_table_associations/1/edit
  def edit
  end

  # POST /aws_route_table_associations
  # POST /aws_route_table_associations.json
  def create
    @aws_route_table_association = AwsRouteTableAssociation.new(aws_route_table_association_params)

    respond_to do |format|
      if @aws_route_table_association.save
        format.html { redirect_to @aws_route_table_association, notice: 'Aws route table association was successfully created.' }
        format.json { render :show, status: :created, location: @aws_route_table_association }
      else
        format.html { render :new }
        format.json { render json: @aws_route_table_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_route_table_associations/1
  # PATCH/PUT /aws_route_table_associations/1.json
  def update
    respond_to do |format|
      if @aws_route_table_association.update(aws_route_table_association_params)
        format.html { redirect_to @aws_route_table_association, notice: 'Aws route table association was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_route_table_association }
      else
        format.html { render :edit }
        format.json { render json: @aws_route_table_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_route_table_associations/1
  # DELETE /aws_route_table_associations/1.json
  def destroy
    @aws_route_table_association.destroy
    respond_to do |format|
      format.html { redirect_to aws_route_table_associations_url, notice: 'Aws route table association was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_route_table_association
      @aws_route_table_association = AwsRouteTableAssociation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_route_table_association_params
      params.require(:aws_route_table_association).permit(:route_table_id, :route_table_association_id, :route_table_id, :subnet_id, :main)
    end
end
