class AwsRouteTablePropogatesController < ApplicationController
  before_action :set_aws_route_table_propogate, only: [:show, :edit, :update, :destroy]

  # GET /aws_route_table_propogates
  # GET /aws_route_table_propogates.json
  def index
    @aws_route_table_propogates = AwsRouteTablePropogate.all
  end

  # GET /aws_route_table_propogates/1
  # GET /aws_route_table_propogates/1.json
  def show
  end

  # GET /aws_route_table_propogates/new
  def new
    @aws_route_table_propogate = AwsRouteTablePropogate.new
  end

  # GET /aws_route_table_propogates/1/edit
  def edit
  end

  # POST /aws_route_table_propogates
  # POST /aws_route_table_propogates.json
  def create
    @aws_route_table_propogate = AwsRouteTablePropogate.new(aws_route_table_propogate_params)

    respond_to do |format|
      if @aws_route_table_propogate.save
        format.html { redirect_to @aws_route_table_propogate, notice: 'Aws route table propogate was successfully created.' }
        format.json { render :show, status: :created, location: @aws_route_table_propogate }
      else
        format.html { render :new }
        format.json { render json: @aws_route_table_propogate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_route_table_propogates/1
  # PATCH/PUT /aws_route_table_propogates/1.json
  def update
    respond_to do |format|
      if @aws_route_table_propogate.update(aws_route_table_propogate_params)
        format.html { redirect_to @aws_route_table_propogate, notice: 'Aws route table propogate was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_route_table_propogate }
      else
        format.html { render :edit }
        format.json { render json: @aws_route_table_propogate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_route_table_propogates/1
  # DELETE /aws_route_table_propogates/1.json
  def destroy
    @aws_route_table_propogate.destroy
    respond_to do |format|
      format.html { redirect_to aws_route_table_propogates_url, notice: 'Aws route table propogate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_route_table_propogate
      @aws_route_table_propogate = AwsRouteTablePropogate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_route_table_propogate_params
      params.require(:aws_route_table_propogate).permit(:route_table_id, :gateway_id)
    end
end
