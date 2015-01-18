class AwsAccountAttributesController < ApplicationController
  before_action :set_aws_account_attribute, only: [:show, :edit, :update, :destroy]

  # GET /aws_account_attributes
  # GET /aws_account_attributes.json
  def index
    @aws_account_attributes = AwsAccountAttribute.all
  end

  # GET /aws_account_attributes/1
  # GET /aws_account_attributes/1.json
  def show
  end

  # GET /aws_account_attributes/new
  def new
    @aws_account_attribute = AwsAccountAttribute.new
  end

  # GET /aws_account_attributes/1/edit
  def edit
  end

  # POST /aws_account_attributes
  # POST /aws_account_attributes.json
  def create
    @aws_account_attribute = AwsAccountAttribute.new(aws_account_attribute_params)

    respond_to do |format|
      if @aws_account_attribute.save
        format.html { redirect_to @aws_account_attribute, notice: 'Aws account attribute was successfully created.' }
        format.json { render :show, status: :created, location: @aws_account_attribute }
      else
        format.html { render :new }
        format.json { render json: @aws_account_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_account_attributes/1
  # PATCH/PUT /aws_account_attributes/1.json
  def update
    respond_to do |format|
      if @aws_account_attribute.update(aws_account_attribute_params)
        format.html { redirect_to @aws_account_attribute, notice: 'Aws account attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_account_attribute }
      else
        format.html { render :edit }
        format.json { render json: @aws_account_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_account_attributes/1
  # DELETE /aws_account_attributes/1.json
  def destroy
    @aws_account_attribute.destroy
    respond_to do |format|
      format.html { redirect_to aws_account_attributes_url, notice: 'Aws account attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_account_attribute
      @aws_account_attribute = AwsAccountAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_account_attribute_params
      params.require(:aws_account_attribute).permit(:aws_account_id, :attribute_name, :attribute_value)
    end
end
