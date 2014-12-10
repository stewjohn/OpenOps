class AwsNetworkAclEntriesController < ApplicationController
  before_action :set_aws_network_acl_entry, only: [:show, :edit, :update, :destroy]

  # GET /aws_network_acl_entries
  # GET /aws_network_acl_entries.json
  def index
    @aws_network_acl_entries = AwsNetworkAclEntry.all
  end

  # GET /aws_network_acl_entries/1
  # GET /aws_network_acl_entries/1.json
  def show
  end

  # GET /aws_network_acl_entries/new
  def new
    @aws_network_acl_entry = AwsNetworkAclEntry.new
  end

  # GET /aws_network_acl_entries/1/edit
  def edit
  end

  # POST /aws_network_acl_entries
  # POST /aws_network_acl_entries.json
  def create
    @aws_network_acl_entry = AwsNetworkAclEntry.new(aws_network_acl_entry_params)

    respond_to do |format|
      if @aws_network_acl_entry.save
        format.html { redirect_to @aws_network_acl_entry, notice: 'Aws network acl entry was successfully created.' }
        format.json { render :show, status: :created, location: @aws_network_acl_entry }
      else
        format.html { render :new }
        format.json { render json: @aws_network_acl_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_network_acl_entries/1
  # PATCH/PUT /aws_network_acl_entries/1.json
  def update
    respond_to do |format|
      if @aws_network_acl_entry.update(aws_network_acl_entry_params)
        format.html { redirect_to @aws_network_acl_entry, notice: 'Aws network acl entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_network_acl_entry }
      else
        format.html { render :edit }
        format.json { render json: @aws_network_acl_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_network_acl_entries/1
  # DELETE /aws_network_acl_entries/1.json
  def destroy
    @aws_network_acl_entry.destroy
    respond_to do |format|
      format.html { redirect_to aws_network_acl_entries_url, notice: 'Aws network acl entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_network_acl_entry
      @aws_network_acl_entry = AwsNetworkAclEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_network_acl_entry_params
      params.require(:aws_network_acl_entry).permit(:network_acl_id, :rule_number, :protocol, :rule_action, :egress, :cidr_block, :icmp_type_code, :port_range_from, :port_range_to)
    end
end
