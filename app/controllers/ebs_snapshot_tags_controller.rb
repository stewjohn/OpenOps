class EbsSnapshotTagsController < ApplicationController
  before_action :set_ebs_snapshot_tag, only: [:show, :edit, :update, :destroy]

  # GET /ebs_snapshot_tags
  # GET /ebs_snapshot_tags.json
  def index
    @ebs_snapshot_tags = EbsSnapshotTag.all
  end

  # GET /ebs_snapshot_tags/1
  # GET /ebs_snapshot_tags/1.json
  def show
  end

  # GET /ebs_snapshot_tags/new
  def new
    @ebs_snapshot_tag = EbsSnapshotTag.new
  end

  # GET /ebs_snapshot_tags/1/edit
  def edit
  end

  # POST /ebs_snapshot_tags
  # POST /ebs_snapshot_tags.json
  def create
    @ebs_snapshot_tag = EbsSnapshotTag.new(ebs_snapshot_tag_params)

    respond_to do |format|
      if @ebs_snapshot_tag.save
        format.html { redirect_to @ebs_snapshot_tag, notice: 'Ebs snapshot tag was successfully created.' }
        format.json { render :show, status: :created, location: @ebs_snapshot_tag }
      else
        format.html { render :new }
        format.json { render json: @ebs_snapshot_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ebs_snapshot_tags/1
  # PATCH/PUT /ebs_snapshot_tags/1.json
  def update
    respond_to do |format|
      if @ebs_snapshot_tag.update(ebs_snapshot_tag_params)
        format.html { redirect_to @ebs_snapshot_tag, notice: 'Ebs snapshot tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @ebs_snapshot_tag }
      else
        format.html { render :edit }
        format.json { render json: @ebs_snapshot_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ebs_snapshot_tags/1
  # DELETE /ebs_snapshot_tags/1.json
  def destroy
    @ebs_snapshot_tag.destroy
    respond_to do |format|
      format.html { redirect_to ebs_snapshot_tags_url, notice: 'Ebs snapshot tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ebs_snapshot_tag
      @ebs_snapshot_tag = EbsSnapshotTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ebs_snapshot_tag_params
      params.require(:ebs_snapshot_tag).permit(:snapshot_id, :key, :value)
    end
end
