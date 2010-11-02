class Office < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :state_id, :zip, :country_id, :rfc, :phone, :fax, :website, :company_id, :state_name, :country_name, :taxname
  
  validates_presence_of :address1, :city, :state_id, :country_id, :company_id, :state_name, :country_name, :taxname
  validates_uniqueness_of :rfc
  
  belongs_to :company
  belongs_to :state
  delegate :name, :to => :state, :prefix => true
  belongs_to :country
  delegate :name, :to => :country, :prefix => true
  
  def state_name
    state.name if state
  end
  
  def state_name=(name)
    self.state = State.find_or_create_by_name(name) unless name.blank?
  end
  
  def country_name
    country.name if country
  end
  
  def country_name=(name)
    self.country = Country.find_or_create_by_name(name) unless name.blank?
  end
  
end
