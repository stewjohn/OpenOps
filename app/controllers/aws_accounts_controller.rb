class AwsAccountsController < ApplicationController
  before_action :set_aws_account, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "AWS Accounts", :aws_accounts_path
  # GET /aws_accounts
  # GET /aws_accounts.json
  def index
    @aws_accounts = AwsAccount.all
  end

  # GET /aws_accounts/1
  # GET /aws_accounts/1.json
  def show
  end

  # GET /aws_accounts/new
  def new
    @aws_account = AwsAccount.new
  end

  # GET /aws_accounts/1/edit
  def edit
    add_breadcrumb "Editing #{@aws_account.account_name}"
  end

  # POST /aws_accounts
  # POST /aws_accounts.json
  def create
    @aws_account = AwsAccount.new(aws_account_params)

    respond_to do |format|
      if @aws_account.save
        format.html { redirect_to @aws_account, notice: 'Aws account was successfully created.' }
        format.json { render :show, status: :created, location: @aws_account }
      else
        format.html { render :new }
        format.json { render json: @aws_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_accounts/1
  # PATCH/PUT /aws_accounts/1.json
  def update
    respond_to do |format|
      if @aws_account.update(aws_account_params)
        format.html { redirect_to @aws_account, notice: 'Aws account was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_account }
      else
        format.html { render :edit }
        format.json { render json: @aws_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_accounts/1
  # DELETE /aws_accounts/1.json
  def destroy
    @aws_account.destroy
    respond_to do |format|
      format.html { redirect_to aws_accounts_url, notice: 'Aws account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_account
      @aws_account = AwsAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_account_params
      params.require(:aws_account).permit(:account_name, :environment_id, :access_key_id, :account_number, :secrete_access_key)
    end
end
