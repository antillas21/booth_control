class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :company_id
  validates_presence_of :name, :email
  belongs_to :company
end
