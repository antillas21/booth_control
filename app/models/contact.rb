class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :company_id
  validates_presence_of :name, :email
  belongs_to :company
  
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of :email, :with => EmailRegex
  
end
