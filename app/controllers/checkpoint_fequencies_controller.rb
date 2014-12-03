class CheckpointFequenciesController < ApplicationController
  before_action :set_checkpoint_fequency, only: [:show, :edit, :update, :destroy]

  # GET /checkpoint_fequencies
  # GET /checkpoint_fequencies.json
  def index
    @checkpoint_fequencies = CheckpointFequency.all
  end

  # GET /checkpoint_fequencies/1
  # GET /checkpoint_fequencies/1.json
  def show
  end

  # GET /checkpoint_fequencies/new
  def new
    @checkpoint_fequency = CheckpointFequency.new
  end

  # GET /checkpoint_fequencies/1/edit
  def edit
  end

  # POST /checkpoint_fequencies
  # POST /checkpoint_fequencies.json
  def create
    @checkpoint_fequency = CheckpointFequency.new(checkpoint_fequency_params)

    respond_to do |format|
      if @checkpoint_fequency.save
        format.html { redirect_to @checkpoint_fequency, notice: 'Checkpoint fequency was successfully created.' }
        format.json { render :show, status: :created, location: @checkpoint_fequency }
      else
        format.html { render :new }
        format.json { render json: @checkpoint_fequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkpoint_fequencies/1
  # PATCH/PUT /checkpoint_fequencies/1.json
  def update
    respond_to do |format|
      if @checkpoint_fequency.update(checkpoint_fequency_params)
        format.html { redirect_to @checkpoint_fequency, notice: 'Checkpoint fequency was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkpoint_fequency }
      else
        format.html { render :edit }
        format.json { render json: @checkpoint_fequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkpoint_fequencies/1
  # DELETE /checkpoint_fequencies/1.json
  def destroy
    @checkpoint_fequency.destroy
    respond_to do |format|
      format.html { redirect_to checkpoint_fequencies_url, notice: 'Checkpoint fequency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkpoint_fequency
      @checkpoint_fequency = CheckpointFequency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkpoint_fequency_params
      params.require(:checkpoint_fequency).permit(:name, :hours_apart)
    end
end
