class Doc < ActiveRecord::Base
  belongs_to :finance_record
  has_attached_file :file, {:url => "/system/:hash.:extension", :hash_secret => "longSecretString"}
  do_not_validate_attachment_file_type :file
  include FinanceRecordComponents
end
