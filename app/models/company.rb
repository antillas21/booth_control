class Company < ActiveRecord::Base
  attr_accessible :name, :profile, :exhibitor_type_id, :user_id
  
  validates_presence_of :name, :profile, :exhibitor_type_id
  validates_uniqueness_of :name
  validates_length_of :profile, :maximum => 250
  
  belongs_to :user
  delegate :name, :to => :user, :prefix => true
  belongs_to :exhibitor_type
  delegate :name, :to => :exhibitor_type, :prefix => true
  
  has_many :reservations, :dependent => :destroy
  has_many :booths, :through => :reservations
  has_one :contact, :dependent => :destroy
  has_one :office, :dependent => :destroy
end
