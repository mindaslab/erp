class Company < ActiveRecord::Base
  validates :name, presence: true
  has_many :books
  has_many :records, through: :books
end
