class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :companies
  has_and_belongs_to_many :collab_companies, class_name: "Company"
  
  def can_collaborate? book
    book.user == self
  end
end
