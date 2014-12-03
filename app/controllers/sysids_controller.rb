class SysidsController < ApplicationController
  before_action :set_sysid, only: [:show, :edit, :update, :destroy]

  # GET /sysids
  # GET /sysids.json
  def index
    @sysids = Sysid.all
  end

  # GET /sysids/1
  # GET /sysids/1.json
  def show
  end

  # GET /sysids/new
  def new
    @sysid = Sysid.new
  end

  # GET /sysids/1/edit
  def edit
  end

  # POST /sysids
  # POST /sysids.json
  def create
    @sysid = Sysid.new(sysid_params)

    respond_to do |format|
      if @sysid.save
        format.html { redirect_to @sysid, notice: 'Sysid was successfully created.' }
        format.json { render :show, status: :created, location: @sysid }
      else
        format.html { render :new }
        format.json { render json: @sysid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sysids/1
  # PATCH/PUT /sysids/1.json
  def update
    respond_to do |format|
      if @sysid.update(sysid_params)
        format.html { redirect_to @sysid, notice: 'Sysid was successfully updated.' }
        format.json { render :show, status: :ok, location: @sysid }
      else
        format.html { render :edit }
        format.json { render json: @sysid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sysids/1
  # DELETE /sysids/1.json
  def destroy
    @sysid.destroy
    respond_to do |format|
      format.html { redirect_to sysids_url, notice: 'Sysid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sysid
      @sysid = Sysid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sysid_params
      params.require(:sysid).permit(:name, :owner, :email_notification)
    end
end
