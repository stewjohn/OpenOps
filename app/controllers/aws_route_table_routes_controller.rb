class AwsRouteTableRoutesController < ApplicationController
  before_action :set_aws_route_table_route, only: [:show, :edit, :update, :destroy]

  # GET /aws_route_table_routes
  # GET /aws_route_table_routes.json
  def index
    @aws_route_table_routes = AwsRouteTableRoute.all
  end

  # GET /aws_route_table_routes/1
  # GET /aws_route_table_routes/1.json
  def show
  end

  # GET /aws_route_table_routes/new
  def new
    @aws_route_table_route = AwsRouteTableRoute.new
  end

  # GET /aws_route_table_routes/1/edit
  def edit
  end

  # POST /aws_route_table_routes
  # POST /aws_route_table_routes.json
  def create
    @aws_route_table_route = AwsRouteTableRoute.new(aws_route_table_route_params)

    respond_to do |format|
      if @aws_route_table_route.save
        format.html { redirect_to @aws_route_table_route, notice: 'Aws route table route was successfully created.' }
        format.json { render :show, status: :created, location: @aws_route_table_route }
      else
        format.html { render :new }
        format.json { render json: @aws_route_table_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_route_table_routes/1
  # PATCH/PUT /aws_route_table_routes/1.json
  def update
    respond_to do |format|
      if @aws_route_table_route.update(aws_route_table_route_params)
        format.html { redirect_to @aws_route_table_route, notice: 'Aws route table route was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_route_table_route }
      else
        format.html { render :edit }
        format.json { render json: @aws_route_table_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_route_table_routes/1
  # DELETE /aws_route_table_routes/1.json
  def destroy
    @aws_route_table_route.destroy
    respond_to do |format|
      format.html { redirect_to aws_route_table_routes_url, notice: 'Aws route table route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_route_table_route
      @aws_route_table_route = AwsRouteTableRoute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_route_table_route_params
      params.require(:aws_route_table_route).permit(:route_table_id, :destination_cidr_block, :gateway_id, :instance_id, :instance_owner_id, :network_interface_id, :vpc_peering_connection_id, :state, :origin)
    end
end
