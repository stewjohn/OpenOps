class EbsSnapshotsController < ApplicationController
  before_action :set_ebs_snapshot, only: [:show, :edit, :update, :destroy]

  # GET /ebs_snapshots
  # GET /ebs_snapshots.json
  def index
    @ebs_snapshots = EbsSnapshot.all
  end

  # GET /ebs_snapshots/1
  # GET /ebs_snapshots/1.json
  def show
  end

  # GET /ebs_snapshots/new
  def new
    @ebs_snapshot = EbsSnapshot.new
  end

  # GET /ebs_snapshots/1/edit
  def edit
  end

  # POST /ebs_snapshots
  # POST /ebs_snapshots.json
  def create
    @ebs_snapshot = EbsSnapshot.new(ebs_snapshot_params)

    respond_to do |format|
      if @ebs_snapshot.save
        format.html { redirect_to @ebs_snapshot, notice: 'Ebs snapshot was successfully created.' }
        format.json { render :show, status: :created, location: @ebs_snapshot }
      else
        format.html { render :new }
        format.json { render json: @ebs_snapshot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ebs_snapshots/1
  # PATCH/PUT /ebs_snapshots/1.json
  def update
    respond_to do |format|
      if @ebs_snapshot.update(ebs_snapshot_params)
        format.html { redirect_to @ebs_snapshot, notice: 'Ebs snapshot was successfully updated.' }
        format.json { render :show, status: :ok, location: @ebs_snapshot }
      else
        format.html { render :edit }
        format.json { render json: @ebs_snapshot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ebs_snapshots/1
  # DELETE /ebs_snapshots/1.json
  def destroy
    @ebs_snapshot.destroy
    respond_to do |format|
      format.html { redirect_to ebs_snapshots_url, notice: 'Ebs snapshot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ebs_snapshot
      @ebs_snapshot = EbsSnapshot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ebs_snapshot_params
      params.require(:ebs_snapshot).permit(:aws_account_id, :aws_region_id, :snapshot_id, :volume_id, :state, :start_time, :progress, :owner_id, :description, :volume_size, :encrypted, :replicated)
    end
end
