class InstanceTagsController < ApplicationController
  before_action :set_instance_tag, only: [:show, :edit, :update, :destroy]

  # GET /instance_tags
  # GET /instance_tags.json
  def index
    @instance_tags = InstanceTag.all
  end

  # GET /instance_tags/1
  # GET /instance_tags/1.json
  def show
  end

  # GET /instance_tags/new
  def new
    @instance_tag = InstanceTag.new
  end

  # GET /instance_tags/1/edit
  def edit
  end

  # POST /instance_tags
  # POST /instance_tags.json
  def create
    @instance_tag = InstanceTag.new(instance_tag_params)

    respond_to do |format|
      if @instance_tag.save
        format.html { redirect_to @instance_tag, notice: 'Instance tag was successfully created.' }
        format.json { render :show, status: :created, location: @instance_tag }
      else
        format.html { render :new }
        format.json { render json: @instance_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instance_tags/1
  # PATCH/PUT /instance_tags/1.json
  def update
    respond_to do |format|
      if @instance_tag.update(instance_tag_params)
        format.html { redirect_to @instance_tag, notice: 'Instance tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @instance_tag }
      else
        format.html { render :edit }
        format.json { render json: @instance_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instance_tags/1
  # DELETE /instance_tags/1.json
  def destroy
    @instance_tag.destroy
    respond_to do |format|
      format.html { redirect_to instance_tags_url, notice: 'Instance tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance_tag
      @instance_tag = InstanceTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instance_tag_params
      params.require(:instance_tag).permit(:instance_id, :name, :value)
    end
end
