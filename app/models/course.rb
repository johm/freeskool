class Course < ActiveRecord::Base
  
  scope :approved, where(:is_approved => true)
  
  has_many :sessions
  has_many :locations, :through => :sessions
  
  has_many :signups
  
  belongs_to :user
  
  has_many :students, :through => :signups, :class_name => 'User'

  attr_protected :is_approved
  clean_up_html [:short_description,:long_description]


end
