class InstanceEniMappingsController < ApplicationController
  before_action :set_instance_eni_mapping, only: [:show, :edit, :update, :destroy]

  # GET /instance_eni_mappings
  # GET /instance_eni_mappings.json
  def index
    @instance_eni_mappings = InstanceEniMapping.all
  end

  # GET /instance_eni_mappings/1
  # GET /instance_eni_mappings/1.json
  def show
  end

  # GET /instance_eni_mappings/new
  def new
    @instance_eni_mapping = InstanceEniMapping.new
  end

  # GET /instance_eni_mappings/1/edit
  def edit
  end

  # POST /instance_eni_mappings
  # POST /instance_eni_mappings.json
  def create
    @instance_eni_mapping = InstanceEniMapping.new(instance_eni_mapping_params)

    respond_to do |format|
      if @instance_eni_mapping.save
        format.html { redirect_to @instance_eni_mapping, notice: 'Instance eni mapping was successfully created.' }
        format.json { render :show, status: :created, location: @instance_eni_mapping }
      else
        format.html { render :new }
        format.json { render json: @instance_eni_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instance_eni_mappings/1
  # PATCH/PUT /instance_eni_mappings/1.json
  def update
    respond_to do |format|
      if @instance_eni_mapping.update(instance_eni_mapping_params)
        format.html { redirect_to @instance_eni_mapping, notice: 'Instance eni mapping was successfully updated.' }
        format.json { render :show, status: :ok, location: @instance_eni_mapping }
      else
        format.html { render :edit }
        format.json { render json: @instance_eni_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instance_eni_mappings/1
  # DELETE /instance_eni_mappings/1.json
  def destroy
    @instance_eni_mapping.destroy
    respond_to do |format|
      format.html { redirect_to instance_eni_mappings_url, notice: 'Instance eni mapping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance_eni_mapping
      @instance_eni_mapping = InstanceEniMapping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instance_eni_mapping_params
      params.require(:instance_eni_mapping).permit(:instance_id, :network_interface_id)
    end
end
