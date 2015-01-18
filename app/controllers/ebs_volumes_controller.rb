class EbsVolumesController < ApplicationController
  before_action :set_ebs_volume, only: [:show, :edit, :update, :destroy]

  # GET /ebs_volumes
  # GET /ebs_volumes.json
  def index
    @ebs_volumes = EbsVolume.all
  end

  # GET /ebs_volumes/1
  # GET /ebs_volumes/1.json
  def show
  end

  # GET /ebs_volumes/new
  def new
    @ebs_volume = EbsVolume.new
  end

  # GET /ebs_volumes/1/edit
  def edit
  end

  # POST /ebs_volumes
  # POST /ebs_volumes.json
  def create
    @ebs_volume = EbsVolume.new(ebs_volume_params)

    respond_to do |format|
      if @ebs_volume.save
        format.html { redirect_to @ebs_volume, notice: 'Ebs volume was successfully created.' }
        format.json { render :show, status: :created, location: @ebs_volume }
      else
        format.html { render :new }
        format.json { render json: @ebs_volume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ebs_volumes/1
  # PATCH/PUT /ebs_volumes/1.json
  def update
    respond_to do |format|
      if @ebs_volume.update(ebs_volume_params)
        format.html { redirect_to @ebs_volume, notice: 'Ebs volume was successfully updated.' }
        format.json { render :show, status: :ok, location: @ebs_volume }
      else
        format.html { render :edit }
        format.json { render json: @ebs_volume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ebs_volumes/1
  # DELETE /ebs_volumes/1.json
  def destroy
    @ebs_volume.destroy
    respond_to do |format|
      format.html { redirect_to ebs_volumes_url, notice: 'Ebs volume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ebs_volume
      @ebs_volume = EbsVolume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ebs_volume_params
      params.require(:ebs_volume).permit(:aws_account_id, :aws_region_id, :volume_id, :size, :snapshot_id, :availability_zone, :state, :create_time, :volume_type, :iops, :encrypted)
    end
end
