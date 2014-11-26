class FinanceRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company
  before_action :check_user_is_permitted
  before_action :check_user_is_collaborator
  before_action :set_book
  before_action :set_record, only: [:show, :edit, :update, :destroy,
  :add_contact, :remove_contact]

  # GET /records
  # GET /records.json
  def index
    if params[:contact_id].present?
      @contact = @company.contacts.find(params[:contact_id])
      @records = @book.finance_records.where(contact: @contact)
    else
      @records = @book.finance_records
    end
    @records = @records.search(params[:s]) unless params[:s].empty? if params[:s]
    @records = @records.send(params[:t]) if FinanceRecord.statuses.keys.index(params[:t])
    @records = @records.where("time >= ?", date_to_db_string(params[:st], "beginning")) if params[:st].present?
    @records = @records.where("time <= ?", date_to_db_string(params[:et], "end")) if params[:et].present?
    @records_page = @records.order("time desc").page(params[:page]).per(50) # paginated records
    revenue = @records.revenue.sum(:amount)
    expense = @records.expense.sum(:amount)
    @income = revenue - expense
    @balance = @income + @records.capital.sum(:amount) - @records.draw.sum(:amount) +
    @records.loan_taken.sum(:amount)
    respond_to do |format|
      format.html {}
      format.csv  { send_data @records.order(:sno).to_csv }
      format.xls  {}
    end
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @doc = Doc.new
    @note = Note.new
  end

  # GET /records/new
  def new
    @record = FinanceRecord.new
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @record = FinanceRecord.new(record_params)
    @record.book = @book
    respond_to do |format|
      if @record.save
        format.html { redirect_to company_book_finance_record_path(@company, @book, @record), notice: 'Record was successfully created.' }
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
        format.html { redirect_to company_book_finance_record_path(@company, @book, @record), notice: 'Record was successfully updated.' }
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
      format.html { redirect_to company_book_finance_records_path(@company, @book), notice: "Record deleted successfully." }
      format.json { head :no_content }
    end
  end

  def add_contact
    @contact = @company.contacts.find_by(id: params[:contact_id])
    if @contact
      @record.contact = @contact
      @record.save
      redirect_to :back, notice: "Contact added to record."
    else
      redirect_to :back, notice: "Contact not found."
    end
  end

  def remove_contact
    @contact = @company.contacts.find_by(id: params[:contact_id])
    if @contact
      @record.contact = nil
      @record.save
      redirect_to :back, notice: "Contact removed from record."
    else
      redirect_to :back, notice: "Contact not found."
    end
  end

  private
    def set_record
      @record = @book.finance_records.find(params[:id])
    end

    def set_book
      @book = @company.books.where(id: params[:book_id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:finance_record).permit(:amount, :description, :book_id, :status, :time)
    end

    include UserPermissionCheck
end
