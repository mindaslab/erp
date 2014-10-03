class Doc < ActiveRecord::Base
  belongs_to :finance_record
  has_attached_file :file
  do_not_validate_attachment_file_type :file
end
