class Book < ActiveRecord::Base
  belongs_to :company
  has_many :records
  validates :name, presence: true
end
