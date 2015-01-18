class AwsDhcpOptionAttributesController < ApplicationController
  before_action :set_aws_dhcp_option_attribute, only: [:show, :edit, :update, :destroy]

  # GET /aws_dhcp_option_attributes
  # GET /aws_dhcp_option_attributes.json
  def index
    @aws_dhcp_option_attributes = AwsDhcpOptionAttribute.all
  end

  # GET /aws_dhcp_option_attributes/1
  # GET /aws_dhcp_option_attributes/1.json
  def show
  end

  # GET /aws_dhcp_option_attributes/new
  def new
    @aws_dhcp_option_attribute = AwsDhcpOptionAttribute.new
  end

  # GET /aws_dhcp_option_attributes/1/edit
  def edit
  end

  # POST /aws_dhcp_option_attributes
  # POST /aws_dhcp_option_attributes.json
  def create
    @aws_dhcp_option_attribute = AwsDhcpOptionAttribute.new(aws_dhcp_option_attribute_params)

    respond_to do |format|
      if @aws_dhcp_option_attribute.save
        format.html { redirect_to @aws_dhcp_option_attribute, notice: 'Aws dhcp option attribute was successfully created.' }
        format.json { render :show, status: :created, location: @aws_dhcp_option_attribute }
      else
        format.html { render :new }
        format.json { render json: @aws_dhcp_option_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_dhcp_option_attributes/1
  # PATCH/PUT /aws_dhcp_option_attributes/1.json
  def update
    respond_to do |format|
      if @aws_dhcp_option_attribute.update(aws_dhcp_option_attribute_params)
        format.html { redirect_to @aws_dhcp_option_attribute, notice: 'Aws dhcp option attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_dhcp_option_attribute }
      else
        format.html { render :edit }
        format.json { render json: @aws_dhcp_option_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_dhcp_option_attributes/1
  # DELETE /aws_dhcp_option_attributes/1.json
  def destroy
    @aws_dhcp_option_attribute.destroy
    respond_to do |format|
      format.html { redirect_to aws_dhcp_option_attributes_url, notice: 'Aws dhcp option attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_dhcp_option_attribute
      @aws_dhcp_option_attribute = AwsDhcpOptionAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_dhcp_option_attribute_params
      params.require(:aws_dhcp_option_attribute).permit(:dhcp_options_id, :key, :value)
    end
end
