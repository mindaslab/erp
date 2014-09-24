class Record < ActiveRecord::Base
  enum status: [:revenue, :expense, :pending_revenue, :pending_expense, :credit, :draw]
  belongs_to :book
  SearchableColumns = [:description]
  
  include Searchable
end
