class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company
  before_action :check_user_is_collaborator
  before_action :set_book
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  # GET /records
  # GET /records.json
  def index
    @records = @book.records.order("time desc")
    @records = @records.search(params[:s]) unless params[:s].empty? if params[:s]
    @records = @records.send(params[:t]) if Record.statuses.keys.index(params[:t])
    @records_page = @records.page(params[:page]).per(50) # paginated records
    revenue = @records.revenue.sum(:amount)
    expense = @records.expense.sum(:amount)
    @income = revenue - expense
    @balance = @income + @records.capital.sum(:amount) - @records.draw.sum(:amount) +
    @records.loan_taken.sum(:amount)
  end

  # GET /records/1
  # GET /records/1.json
  def show
  end

  # GET /records/new
  def new
    @record = Record.new
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)
    @record.book = @book
    respond_to do |format|
      if @record.save
        format.html { redirect_to company_book_records_path(@company, @book), notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to company_book_records_path(@company, @book), notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: "Record deleted successfully." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    def set_book
      @book = @company.books.where(id: params[:book_id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:amount, :description, :book_id, :status, :time)
    end

    include UserPermissionCheck
end
