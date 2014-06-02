module RecordsHelper
  def record_status_options
    Record.statuses.collect{ |k,v| [k.gsub(/_/, " ").capitalize, k]}
  end
end
