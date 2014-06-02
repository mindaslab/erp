module RecordsHelper
  def record_status_options
    Record.statuses.collect{ |k,v| [k.gsub(/_/, " ").capitalize, k]}
  end
  
  def record_color(record)
    case record.status
      when "income"
        "success"
      when "expense"
        "danger"
      when "pending_income"
        "info"
      when "pending_expense"
        "warning"
    end 
  end
end
