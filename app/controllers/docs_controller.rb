require 'open-uri' # for reading ffiles from remote location

class DocsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company
  before_action :check_user_is_permitted
  before_action :check_user_is_collaborator
  before_action :set_book
  before_action :set_record
  before_action :set_doc, only: [:update, :destroy, :download]


  # POST /docs
  # POST /docs.json
  def create
    @doc = Doc.new(doc_params)
    @doc.finance_record = @record
    respond_to do |format|
      if @doc.save
        format.html { redirect_to :back, notice: 'File was successfully added.' }
        format.json { render :show, status: :created, location: @doc }
      else
        format.html { redirect_to :back, notice: 'File not accepted.' }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /docs/1
  # DELETE /docs/1.json
  def destroy
    @doc.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: "Document deleted." }
      format.json { head :no_content }
    end
  end

  def download
    if Rails.application.config.paperclip_defaults[:storage] != :s3
      puts "*" * 50
      send_file File.open(@doc.file.path), filename: @doc.file_file_name
    else
      puts "#" * 50
      file_contents = open(@doc.file.url) { |f| f.read }
      send_data file_contents, filename: @doc.file_file_name, type: @doc.file_content_type
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doc
      @doc = @record.docs.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doc_params
      params.require(:doc).permit(:file)
    end

    include SetBookAndRecord

    include UserPermissionCheck
end
