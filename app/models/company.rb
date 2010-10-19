class Company < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :exhibitor_type
end
