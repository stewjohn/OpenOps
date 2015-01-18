class HostsController < ApplicationController
  before_action :set_host, only: [:show, :edit, :update, :destroy, :snapshot, :reboot]
  add_breadcrumb 'Hosts', '/hosts'
  # GET /hosts
  # GET /hosts.json
  def index
    @hosts = Host.include_all.all
  end

  # GET /hosts/1
  # GET /hosts/1.json
  def show
    @instance = Instance.find_by_instance_id(@host.instance_id)
    @instance_eni_mappings = InstanceEniMapping.joins(:instance_eni).where(instance_id: @host.instance_id )
    @instance_block_device_mappings = InstanceBlockDeviceMapping.join_all.where(instance_id: @host.instance_id)
    @ebs_snapshots =  EbsSnapshot.latest_snaps(@host.instance_id).order(created_at: :desc).limit(5)
	vols = Instance.volumes(@host.instance_id)
	@instance_tags = InstanceTag.where(instance_id: @host.instance_id)
	@dr_snapshots = EbsSnapshot.where(replicant_of: vols).order(created_at: :desc).limit(5)
	
  end

  # GET /hosts/new
  def new
    @host = Host.new
    @environments = Environment.all
    @sysids = Sysid.all
    @instances = Instance.where(host_id: nil, state: "running")

  end

  # GET /hosts/1/edit
  def edit
    @environments = Environment.all
    @sysids = Sysid.all
    @instances = Instance.where(host_id: nil)
  end

  # POST /hosts
  # POST /hosts.json
  def create
    @host = Host.new(host_params)
    instance = Instance.find_by_instance_id(@host.instance_id)
    sysid = Sysid.find(@host.sysid_id)
    respond_to do |format|
      if @host.save
	instance.host_id = @host.id
	instance.save
	Instance.add_update_tag(@host.instance_id,"Name",@host.hostname)
	Instance.add_update_tag(@host.instance_id,"SYSID",sysid.name)
    Instance.update_volume_tags(@host.instance_id,"Name",@host.hostname)
    Instance.update_volume_tags(@host.instance_id,"SYSID",sysid.name)
	Instance.update_volume_tags(@host.instance_id,"host_id",@host.id)
	format.html { redirect_to @host, notice: 'Host was successfully created.' }
        format.json { render :show, status: :created, location: @host }
      else
        format.html { render :new }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hosts/1
  # PATCH/PUT /hosts/1.json
  def update
    sysid = Sysid.find(@host.sysid_id)
    respond_to do |format|
      if @host.update(host_params)
	Instance.add_update_tag(@host.instance_id,"Name",@host.hostname)
        Instance.add_update_tag(@host.instance_id,"SYSID",sysid.name)
	Instance.update_volume_tags(@host.instance_id,"Name",@host.hostname)
        Instance.update_volume_tags(@host.instance_id,"SYSID",sysid.name)
        Instance.update_volume_tags(@host.instance_id,"host_id",@host.id)
        format.html { redirect_to @host, notice: 'Host was successfully updated.' }
        format.json { render :show, status: :ok, location: @host }
      else
        format.html { render :edit }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hosts/1
  # DELETE /hosts/1.json
  def destroy
    @host.destroy
    respond_to do |format|
      format.html { redirect_to hosts_url, notice: 'Host was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
#####

  def snapshot
	EbsVolume.create_snaps(@host.id)
	redirect_to :back
  end
  
  def reboot
	Instance.reboot(@host.instance_id)
	redirect_to :back
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host
      @host = Host.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def host_params
      params.require(:host).permit(:hostname, :environment_id, :aws_account_id, :sysid, :chef_environment_id, :host_state_id, :sysid_id, :instance_id)
    end
end
