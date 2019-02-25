class ResourceMetadataController < ApplicationController
  before_action :set_resource_metadatum, only: [:show, :edit, :update, :destroy]

  # GET /resource_metadata
  # GET /resource_metadata.json
  def index
    @resource_metadata = ResourceMetadatum.all
  end

  # GET /resource_metadata/1
  # GET /resource_metadata/1.json
  def show
  end

  # GET /resource_metadata/new
  def new
    @resource_metadatum = ResourceMetadatum.new
  end

  # GET /resource_metadata/1/edit
  def edit
  end

  # POST /resource_metadata
  # POST /resource_metadata.json
  def create
    @resource_metadatum = ResourceMetadatum.new(resource_metadatum_params)

    respond_to do |format|
      if @resource_metadatum.save
        format.html { redirect_to @resource_metadatum, notice: 'Resource metadatum was successfully created.' }
        format.json { render :show, status: :created, location: @resource_metadatum }
      else
        format.html { render :new }
        format.json { render json: @resource_metadatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resource_metadata/1
  # PATCH/PUT /resource_metadata/1.json
  def update
    respond_to do |format|
      if @resource_metadatum.update(resource_metadatum_params)
        format.html { redirect_to @resource_metadatum, notice: 'Resource metadatum was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource_metadatum }
      else
        format.html { render :edit }
        format.json { render json: @resource_metadatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_metadata/1
  # DELETE /resource_metadata/1.json
  def destroy
    @resource_metadatum.destroy
    respond_to do |format|
      format.html { redirect_to resource_metadata_url, notice: 'Resource metadatum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource_metadatum
      @resource_metadatum = ResourceMetadatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_metadatum_params
      params.require(:resource_metadatum).permit(:Title, :Author, :publish_date, :Abstract, :Link)
    end
end
