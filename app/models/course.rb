class Course < ActiveRecord::Base
  
  
  scope :approved, where(:is_approved => true)
  
  has_many :course_sessions, :dependent => :destroy
  has_many :locations, :through => :course_sessions
  
  #these tbtested
  has_many :signups, :dependent => :destroy
  has_many :users, :through => :signups
  belongs_to :instructor, :foreign_key => :user_id, :class_name => 'User'
  

  editable_attributes = [:name,:short_description,:long_description]
  attr_accessible *editable_attributes
  attr_accessible :name,:short_description,:long_description,:is_approved, :as=>:admin

  clean_up_html [:short_description,:long_description]

end
