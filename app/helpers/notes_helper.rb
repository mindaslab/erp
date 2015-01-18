module NotesHelper
  def hash_link note
    text = note.content
    hash_nos = text.scan(/#\d+/).uniq
    for hash_no in hash_nos
      hash_no.match /(\d+)/
      number = $1.to_i
      record = note.finance_record.book.finance_records.find_by(sno: number)
      text.gsub!(/#{hash_no}/, link_to(hash_no, company_book_finance_record_path(record.book.company,
      record.book, record))) if record
    end
    text
  end
end
