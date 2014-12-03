class EbsVolumeTagsController < ApplicationController
  before_action :set_ebs_volume_tag, only: [:show, :edit, :update, :destroy]

  # GET /ebs_volume_tags
  # GET /ebs_volume_tags.json
  def index
    @ebs_volume_tags = EbsVolumeTag.all
  end

  # GET /ebs_volume_tags/1
  # GET /ebs_volume_tags/1.json
  def show
  end

  # GET /ebs_volume_tags/new
  def new
    @ebs_volume_tag = EbsVolumeTag.new
  end

  # GET /ebs_volume_tags/1/edit
  def edit
  end

  # POST /ebs_volume_tags
  # POST /ebs_volume_tags.json
  def create
    @ebs_volume_tag = EbsVolumeTag.new(ebs_volume_tag_params)

    respond_to do |format|
      if @ebs_volume_tag.save
        format.html { redirect_to @ebs_volume_tag, notice: 'Ebs volume tag was successfully created.' }
        format.json { render :show, status: :created, location: @ebs_volume_tag }
      else
        format.html { render :new }
        format.json { render json: @ebs_volume_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ebs_volume_tags/1
  # PATCH/PUT /ebs_volume_tags/1.json
  def update
    respond_to do |format|
      if @ebs_volume_tag.update(ebs_volume_tag_params)
        format.html { redirect_to @ebs_volume_tag, notice: 'Ebs volume tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @ebs_volume_tag }
      else
        format.html { render :edit }
        format.json { render json: @ebs_volume_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ebs_volume_tags/1
  # DELETE /ebs_volume_tags/1.json
  def destroy
    @ebs_volume_tag.destroy
    respond_to do |format|
      format.html { redirect_to ebs_volume_tags_url, notice: 'Ebs volume tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ebs_volume_tag
      @ebs_volume_tag = EbsVolumeTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ebs_volume_tag_params
      params.require(:ebs_volume_tag).permit(:volume_id, :key, :value)
    end
end
