class InstanceBlockDeviceMappingsController < ApplicationController
  before_action :set_instance_block_device_mapping, only: [:show, :edit, :update, :destroy]

  # GET /instance_block_device_mappings
  # GET /instance_block_device_mappings.json
  def index
    @instance_block_device_mappings = InstanceBlockDeviceMapping.all
  end

  # GET /instance_block_device_mappings/1
  # GET /instance_block_device_mappings/1.json
  def show
  end

  # GET /instance_block_device_mappings/new
  def new
    @instance_block_device_mapping = InstanceBlockDeviceMapping.new
  end

  # GET /instance_block_device_mappings/1/edit
  def edit
  end

  # POST /instance_block_device_mappings
  # POST /instance_block_device_mappings.json
  def create
    @instance_block_device_mapping = InstanceBlockDeviceMapping.new(instance_block_device_mapping_params)

    respond_to do |format|
      if @instance_block_device_mapping.save
        format.html { redirect_to @instance_block_device_mapping, notice: 'Instance block device mapping was successfully created.' }
        format.json { render :show, status: :created, location: @instance_block_device_mapping }
      else
        format.html { render :new }
        format.json { render json: @instance_block_device_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instance_block_device_mappings/1
  # PATCH/PUT /instance_block_device_mappings/1.json
  def update
    respond_to do |format|
      if @instance_block_device_mapping.update(instance_block_device_mapping_params)
        format.html { redirect_to @instance_block_device_mapping, notice: 'Instance block device mapping was successfully updated.' }
        format.json { render :show, status: :ok, location: @instance_block_device_mapping }
      else
        format.html { render :edit }
        format.json { render json: @instance_block_device_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instance_block_device_mappings/1
  # DELETE /instance_block_device_mappings/1.json
  def destroy
    @instance_block_device_mapping.destroy
    respond_to do |format|
      format.html { redirect_to instance_block_device_mappings_url, notice: 'Instance block device mapping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance_block_device_mapping
      @instance_block_device_mapping = InstanceBlockDeviceMapping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instance_block_device_mapping_params
      params.require(:instance_block_device_mapping).permit(:instance_id, :device_name, :volume_id)
    end
end
