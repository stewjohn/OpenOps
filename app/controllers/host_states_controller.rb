class HostStatesController < ApplicationController
  before_action :set_host_state, only: [:show, :edit, :update, :destroy]

  # GET /host_states
  # GET /host_states.json
  def index
    @host_states = HostState.all
  end

  # GET /host_states/1
  # GET /host_states/1.json
  def show
  end

  # GET /host_states/new
  def new
    @host_state = HostState.new
  end

  # GET /host_states/1/edit
  def edit
  end

  # POST /host_states
  # POST /host_states.json
  def create
    @host_state = HostState.new(host_state_params)

    respond_to do |format|
      if @host_state.save
        format.html { redirect_to @host_state, notice: 'Host state was successfully created.' }
        format.json { render :show, status: :created, location: @host_state }
      else
        format.html { render :new }
        format.json { render json: @host_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /host_states/1
  # PATCH/PUT /host_states/1.json
  def update
    respond_to do |format|
      if @host_state.update(host_state_params)
        format.html { redirect_to @host_state, notice: 'Host state was successfully updated.' }
        format.json { render :show, status: :ok, location: @host_state }
      else
        format.html { render :edit }
        format.json { render json: @host_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /host_states/1
  # DELETE /host_states/1.json
  def destroy
    @host_state.destroy
    respond_to do |format|
      format.html { redirect_to host_states_url, notice: 'Host state was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host_state
      @host_state = HostState.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def host_state_params
      params.require(:host_state).permit(:name)
    end
end
