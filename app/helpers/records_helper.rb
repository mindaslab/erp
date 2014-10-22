module RecordsHelper
  def record_status_options
    FinanceRecord.statuses.collect{ |k,v| [k.gsub(/_/, " ").capitalize, k]}.sort
  end

  def record_color(record)
    case record.status
      when "revenue"
        "success"
      when "expense"
        "danger"
      when "pending_revenue"
        "info"
      when "pending_expense"
        "warning"
      when "loan_taken"
        "loan"
      else
        record.status
    end
  end

  def money_link(records, book, type, search_term=nil)
    # book was passed because records.book did not work if records were nil
    company = book.company
    amount = records.send(type).sum(:amount)
    label = type.gsub(/_/, " ").capitalize
    display_text = "#{label}: #{book.currency} #{amount}"
    if search_term
      link_to display_text, company_book_finance_records_path(company, book, t: type, s: search_term)
    else
      link_to display_text, company_book_finance_records_path(company, book, t: type)
    end
  end
end
