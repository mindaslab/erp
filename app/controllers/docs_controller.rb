class DocsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company
  before_action :check_user_is_collaborator
  before_action :set_book
  before_action :set_record
  before_action :set_doc, only: [:update, :destroy]

  # GET /docs/new
  def new
    @doc = Doc.new
  end


  # POST /docs
  # POST /docs.json
  def create
    @doc = Doc.new(doc_params)
    @doc.finance_record = @finance_record
    respond_to do |format|
      if @doc.save
        format.html { redirect_to :back, notice: 'File was successfully added.' }
        format.json { render :show, status: :created, location: @doc }
      else
        format.html { render :new }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /docs/1
  # DELETE /docs/1.json
  def destroy
    @doc.destroy
    respond_to do |format|
      format.html { redirect_to docs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doc
      @doc = Doc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doc_params
      params.require(:doc).permit(:file)
    end

    def set_record
      @record = @book.finance_records.find(params[:record_id])
    end

    def set_book
      @book = @company.books.where(id: params[:book_id]).first
    end

    include UserPermissionCheck
end
