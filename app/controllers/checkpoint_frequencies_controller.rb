class CheckpointFrequenciesController < ApplicationController
  before_action :set_checkpoint_frequency, only: [:show, :edit, :update, :destroy]

  # GET /checkpoint_frequencies
  # GET /checkpoint_frequencies.json
  def index
    @checkpoint_frequencies = CheckpointFrequency.all
  end

  # GET /checkpoint_frequencies/1
  # GET /checkpoint_frequencies/1.json
  def show
  end

  # GET /checkpoint_frequencies/new
  def new
    @checkpoint_frequency = CheckpointFrequency.new
  end

  # GET /checkpoint_frequencies/1/edit
  def edit
  end

  # POST /checkpoint_frequencies
  # POST /checkpoint_frequencies.json
  def create
    @checkpoint_frequency = CheckpointFrequency.new(checkpoint_frequency_params)

    respond_to do |format|
      if @checkpoint_frequency.save
        format.html { redirect_to @checkpoint_frequency, notice: 'Checkpoint frequency was successfully created.' }
        format.json { render :show, status: :created, location: @checkpoint_frequency }
      else
        format.html { render :new }
        format.json { render json: @checkpoint_frequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkpoint_frequencies/1
  # PATCH/PUT /checkpoint_frequencies/1.json
  def update
    respond_to do |format|
      if @checkpoint_frequency.update(checkpoint_frequency_params)
        format.html { redirect_to @checkpoint_frequency, notice: 'Checkpoint frequency was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkpoint_frequency }
      else
        format.html { render :edit }
        format.json { render json: @checkpoint_frequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkpoint_frequencies/1
  # DELETE /checkpoint_frequencies/1.json
  def destroy
    @checkpoint_frequency.destroy
    respond_to do |format|
      format.html { redirect_to checkpoint_frequencies_url, notice: 'Checkpoint frequency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkpoint_frequency
      @checkpoint_frequency = CheckpointFrequency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkpoint_frequency_params
      params.require(:checkpoint_frequency).permit(:name, :hours_apart)
    end
end
