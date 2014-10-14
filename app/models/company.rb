class Company < ActiveRecord::Base
  validates :name, presence: true
  has_many :books
  has_many :finance_records, through: :books
  has_many :contacts
  belongs_to :user
  has_and_belongs_to_many :collaborators, class_name: "User"

  SearchableColumns = [:name, :description]
  include Searchable

  # Returns true if the user can collaborate for the company
  def collaborator? user_obj
    (self.user == user_obj) or (self.collaborators.index(user_obj))
  end
end
