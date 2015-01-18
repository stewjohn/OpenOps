class InstanceSecurityGroupMappingsController < ApplicationController
  before_action :set_instance_security_group_mapping, only: [:show, :edit, :update, :destroy]

  # GET /instance_security_group_mappings
  # GET /instance_security_group_mappings.json
  def index
    @instance_security_group_mappings = InstanceSecurityGroupMapping.all
  end

  # GET /instance_security_group_mappings/1
  # GET /instance_security_group_mappings/1.json
  def show
  end

  # GET /instance_security_group_mappings/new
  def new
    @instance_security_group_mapping = InstanceSecurityGroupMapping.new
  end

  # GET /instance_security_group_mappings/1/edit
  def edit
  end

  # POST /instance_security_group_mappings
  # POST /instance_security_group_mappings.json
  def create
    @instance_security_group_mapping = InstanceSecurityGroupMapping.new(instance_security_group_mapping_params)

    respond_to do |format|
      if @instance_security_group_mapping.save
        format.html { redirect_to @instance_security_group_mapping, notice: 'Instance security group mapping was successfully created.' }
        format.json { render :show, status: :created, location: @instance_security_group_mapping }
      else
        format.html { render :new }
        format.json { render json: @instance_security_group_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instance_security_group_mappings/1
  # PATCH/PUT /instance_security_group_mappings/1.json
  def update
    respond_to do |format|
      if @instance_security_group_mapping.update(instance_security_group_mapping_params)
        format.html { redirect_to @instance_security_group_mapping, notice: 'Instance security group mapping was successfully updated.' }
        format.json { render :show, status: :ok, location: @instance_security_group_mapping }
      else
        format.html { render :edit }
        format.json { render json: @instance_security_group_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instance_security_group_mappings/1
  # DELETE /instance_security_group_mappings/1.json
  def destroy
    @instance_security_group_mapping.destroy
    respond_to do |format|
      format.html { redirect_to instance_security_group_mappings_url, notice: 'Instance security group mapping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance_security_group_mapping
      @instance_security_group_mapping = InstanceSecurityGroupMapping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instance_security_group_mapping_params
      params.require(:instance_security_group_mapping).permit(:instance_id, :group_id)
    end
end
