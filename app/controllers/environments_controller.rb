class EnvironmentsController < ApplicationController
  before_action :set_environment, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "AWS Environments", :environments_path
  # GET /environments
  # GET /environments.json
  def index
    @environments = Environment.all
  end

  # GET /environments/1
  # GET /environments/1.json
  def show
  end

  # GET /environments/new
  def new
    @environment = Environment.new
    @accounts = AwsAccount.with_vpc
  end

  # GET /environments/1/edit
  def edit
    add_breadcrumb 'Edit Environment'
    @accounts = AwsAccount.with_vpc
    @vpcs = AwsVpc.include_all.all
    @check = CheckpointFrequency.all

  end

  # POST /environments
  # POST /environments.json
  def create
    @environment = Environment.new(environment_params)

      if @environment.save
        redirect_to "/environments/#{@environment.id}/edit" 
      else
        render :new 
      end
  end

  # PATCH/PUT /environments/1
  # PATCH/PUT /environments/1.json
  def update
    respond_to do |format|
     if @environment.update(environment_params)
        if params[:environment][:dr_enabled].nil?
          @environment.dr_enabled=false
          @environment.save
        end
        format.html { redirect_to @environment, notice: 'Environment was successfully updated.' }
        format.json { render :show, status: :ok, location: @environment }
      else
        format.html { render :edit }
        format.json { render json: @environment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /environments/1
  # DELETE /environments/1.json
  def destroy
    @environment.destroy
    respond_to do |format|
      format.html { redirect_to environments_url, notice: 'Environment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_environment
      @environment = Environment.with_vpcs.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def environment_params
      params.require(:environment).permit(:name, :aws_account_id, :primary_vpc_id, :dr_vpc_id, :dr_enabled, :checkpoint_frequency_id, :dr_lead_time, :backup_retention, :dr_security_group_id)

    end
end
