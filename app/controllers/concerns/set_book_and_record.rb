module SetBookAndRecord
  extend ActiveSupport::Concern
  def set_record
    @record = @book.finance_records.find(params[:finance_record_id])
  end

  def set_book
    @book = @company.books.where(id: params[:book_id]).first
  end
end
