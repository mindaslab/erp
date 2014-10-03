class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company
  before_action :check_user_is_collaborator
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = @company.books.order(:name).page(params[:page]).per(10)
    @books = @books.search(params[:s]) unless params[:s].empty? if params[:s]
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @company = Company.find params[:company_id]
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @company = @book.company
  end

  # POST /books
  # POST /books.json
  def create
    @company = Company.find params[:company_id]
    @book = Book.new(book_params)
    @book.company = @company

    respond_to do |format|
      if @book.save
        format.html { redirect_to company_book_finance_records_path(@company, @book), notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      @book.company = @company
      if @book.update(book_params)
        format.html {  redirect_to company_book_finance_records_path(@company, @book), notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  private    
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = @company.books.where(id: params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :description, :currency)
    end

    include UserPermissionCheck
end
