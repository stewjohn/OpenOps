class InstanceEnisController < ApplicationController
  before_action :set_instance_eni, only: [:show, :edit, :update, :destroy]

  # GET /instance_enis
  # GET /instance_enis.json
  def index
    @instance_enis = InstanceEni.all
  end

  # GET /instance_enis/1
  # GET /instance_enis/1.json
  def show
  end

  # GET /instance_enis/new
  def new
    @instance_eni = InstanceEni.new
  end

  # GET /instance_enis/1/edit
  def edit
  end

  # POST /instance_enis
  # POST /instance_enis.json
  def create
    @instance_eni = InstanceEni.new(instance_eni_params)

    respond_to do |format|
      if @instance_eni.save
        format.html { redirect_to @instance_eni, notice: 'Instance eni was successfully created.' }
        format.json { render :show, status: :created, location: @instance_eni }
      else
        format.html { render :new }
        format.json { render json: @instance_eni.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instance_enis/1
  # PATCH/PUT /instance_enis/1.json
  def update
    respond_to do |format|
      if @instance_eni.update(instance_eni_params)
        format.html { redirect_to @instance_eni, notice: 'Instance eni was successfully updated.' }
        format.json { render :show, status: :ok, location: @instance_eni }
      else
        format.html { render :edit }
        format.json { render json: @instance_eni.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instance_enis/1
  # DELETE /instance_enis/1.json
  def destroy
    @instance_eni.destroy
    respond_to do |format|
      format.html { redirect_to instance_enis_url, notice: 'Instance eni was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance_eni
      @instance_eni = InstanceEni.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instance_eni_params
      params.require(:instance_eni).permit(:host_id, :instance_id, :network_interface_id, :subnet_id, :vpc_id, :owner_id, :status, :mac_address, :source_dest_check, :attachment_id, :attach_date_time, :public_ip, :public_dns_name, :private_ip_addresses, :private_dns_name)
    end
end
