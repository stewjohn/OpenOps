class AwsDhcpOptionsController < ApplicationController
  before_action :set_aws_dhcp_option, only: [:show, :edit, :update, :destroy]

  # GET /aws_dhcp_options
  # GET /aws_dhcp_options.json
  def index
    @aws_dhcp_options = AwsDhcpOption.all
  end

  # GET /aws_dhcp_options/1
  # GET /aws_dhcp_options/1.json
  def show
  end

  # GET /aws_dhcp_options/new
  def new
    @aws_dhcp_option = AwsDhcpOption.new
  end

  # GET /aws_dhcp_options/1/edit
  def edit
  end

  # POST /aws_dhcp_options
  # POST /aws_dhcp_options.json
  def create
    @aws_dhcp_option = AwsDhcpOption.new(aws_dhcp_option_params)

    respond_to do |format|
      if @aws_dhcp_option.save
        format.html { redirect_to @aws_dhcp_option, notice: 'Aws dhcp option was successfully created.' }
        format.json { render :show, status: :created, location: @aws_dhcp_option }
      else
        format.html { render :new }
        format.json { render json: @aws_dhcp_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_dhcp_options/1
  # PATCH/PUT /aws_dhcp_options/1.json
  def update
    respond_to do |format|
      if @aws_dhcp_option.update(aws_dhcp_option_params)
        format.html { redirect_to @aws_dhcp_option, notice: 'Aws dhcp option was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_dhcp_option }
      else
        format.html { render :edit }
        format.json { render json: @aws_dhcp_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_dhcp_options/1
  # DELETE /aws_dhcp_options/1.json
  def destroy
    @aws_dhcp_option.destroy
    respond_to do |format|
      format.html { redirect_to aws_dhcp_options_url, notice: 'Aws dhcp option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_dhcp_option
      @aws_dhcp_option = AwsDhcpOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_dhcp_option_params
      params.require(:aws_dhcp_option).permit(:aws_account_id, :aws_region_id, :dhcp_options_id)
    end
end
