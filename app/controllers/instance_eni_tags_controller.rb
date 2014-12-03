class InstanceEniTagsController < ApplicationController
  before_action :set_instance_eni_tag, only: [:show, :edit, :update, :destroy]

  # GET /instance_eni_tags
  # GET /instance_eni_tags.json
  def index
    @instance_eni_tags = InstanceEniTag.all
  end

  # GET /instance_eni_tags/1
  # GET /instance_eni_tags/1.json
  def show
  end

  # GET /instance_eni_tags/new
  def new
    @instance_eni_tag = InstanceEniTag.new
  end

  # GET /instance_eni_tags/1/edit
  def edit
  end

  # POST /instance_eni_tags
  # POST /instance_eni_tags.json
  def create
    @instance_eni_tag = InstanceEniTag.new(instance_eni_tag_params)

    respond_to do |format|
      if @instance_eni_tag.save
        format.html { redirect_to @instance_eni_tag, notice: 'Instance eni tag was successfully created.' }
        format.json { render :show, status: :created, location: @instance_eni_tag }
      else
        format.html { render :new }
        format.json { render json: @instance_eni_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instance_eni_tags/1
  # PATCH/PUT /instance_eni_tags/1.json
  def update
    respond_to do |format|
      if @instance_eni_tag.update(instance_eni_tag_params)
        format.html { redirect_to @instance_eni_tag, notice: 'Instance eni tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @instance_eni_tag }
      else
        format.html { render :edit }
        format.json { render json: @instance_eni_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instance_eni_tags/1
  # DELETE /instance_eni_tags/1.json
  def destroy
    @instance_eni_tag.destroy
    respond_to do |format|
      format.html { redirect_to instance_eni_tags_url, notice: 'Instance eni tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance_eni_tag
      @instance_eni_tag = InstanceEniTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instance_eni_tag_params
      params.require(:instance_eni_tag).permit(:instance_id, :key, :value)
    end
end
