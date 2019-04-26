class ResourceMetadataController < ApplicationController
  before_action :set_resource_metadatum, only: [:show, :edit, :update, :destroy]

  # GET /resource_metadata
  # GET /resource_metadata.json
  def index
    @resource_metadata = ResourceMetadatum.search(params[:search])
  end

  # GET /resource_metadata/1
  # GET /resource_metadata/1.json
  def show
  end

  # GET /resource_metadata/new
  def new
    @cur_tags = Tag.all
    @cur_authors = Author.all
    @resource_metadatum = ResourceMetadatum.new
  end

  # GET /resource_metadata/1/edit
  def edit
  end

  # POST /resource_metadata
  # POST /resource_metadata.json
  def create
    puts('Creating new resource metadatum')
    @resource_metadatum = ResourceMetadatum.new(resource_metadatum_params)
    @add_tags = params[:add_tags]
    @add_authors = params[:add_authors]
    respond_to do |format|
      #TODO: check for user permissions to add tags
      if @resource_metadatum.save
        #Save any new tags to DB
        if @add_tags != nil
          for tag in @add_tags
            tag_link = -1
            if((temp = Tag.find_by id: tag) == nil)
              new_tag = Tag.new(Tag_Title: tag);
              if new_tag.save
                puts("Creating new tag #{tag} with id #{new_tag.id}")
                tag_link = ResourceTag.new(resource_metadatum_id: @resource_metadatum.id.to_i, tag_id: new_tag.id.to_i)
              else
                format.html { render :new}
                format.json { render json: @tag.errors, status: :unprocessable_entity }
              end
            else
              puts("Found existing tag #{temp.Tag_Title} with id #{temp.id}")
              tag_link = ResourceTag.new(resource_metadatum_id: @resource_metadatum.id.to_i, tag_id: temp.id.to_i)
            end
            if not tag_link.save
              format.html { render :new}
              format.json { render json: tag_link.errors, status: :unprocessable_entity }
            end
          end
        end
        #Save any new authors to DB
        if @add_authors != nil
          for author in @add_authors
            author_link = -1
            if((temp = Author.find_by id: author) == nil)
              new_author = Author.new(author_name: author);
              if new_author.save
                puts("Creating new author #{author} with id #{new_author.id}")
                author_link = Resource_MetadataAuthor.new(resource_metadatum_id: @resource_metadatum.id.to_i, author_id: new_author.id.to_i)
              else
                format.html { render :new}
                format.json { render json: @author.errors, status: :unprocessable_entity }
              end
            else
              puts("Found existing author #{temp.author_name} with id #{temp.id}")
              author_link = Resource_MetadataAuthor.new(resource_metadatum_id: @resource_metadatum.id.to_i, author_id: temp.id.to_i)
            end
            if not author_link.save
              format.html { render :new}
              format.json { render json: author_link.errors, status: :unprocessable_entity }
            end
          end
        end
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
      params.require(:resource_metadatum).permit(:Title, :Author, :publish_date, :Abstract, :Link, :search)
    end
end
