class AwsRouteTablesController < ApplicationController
  before_action :set_aws_route_table, only: [:show, :edit, :update, :destroy]

  # GET /aws_route_tables
  # GET /aws_route_tables.json
  def index
    @aws_route_tables = AwsRouteTable.all
  end

  # GET /aws_route_tables/1
  # GET /aws_route_tables/1.json
  def show
  end

  # GET /aws_route_tables/new
  def new
    @aws_route_table = AwsRouteTable.new
  end

  # GET /aws_route_tables/1/edit
  def edit
  end

  # POST /aws_route_tables
  # POST /aws_route_tables.json
  def create
    @aws_route_table = AwsRouteTable.new(aws_route_table_params)

    respond_to do |format|
      if @aws_route_table.save
        format.html { redirect_to @aws_route_table, notice: 'Aws route table was successfully created.' }
        format.json { render :show, status: :created, location: @aws_route_table }
      else
        format.html { render :new }
        format.json { render json: @aws_route_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_route_tables/1
  # PATCH/PUT /aws_route_tables/1.json
  def update
    respond_to do |format|
      if @aws_route_table.update(aws_route_table_params)
        format.html { redirect_to @aws_route_table, notice: 'Aws route table was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_route_table }
      else
        format.html { render :edit }
        format.json { render json: @aws_route_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_route_tables/1
  # DELETE /aws_route_tables/1.json
  def destroy
    @aws_route_table.destroy
    respond_to do |format|
      format.html { redirect_to aws_route_tables_url, notice: 'Aws route table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_route_table
      @aws_route_table = AwsRouteTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_route_table_params
      params.require(:aws_route_table).permit(:aws_account_id, :aws_region_id, :route_table_id, :vpc_id)
    end
end
