class Course < ActiveRecord::Base
  
  
  scope :approved, where(:is_approved => true)
  
  has_many :course_sessions, :dependent => :destroy
  has_many :locations, :through => :sessions
  
  has_many :signups, :dependent => :destroy
  
  belongs_to :instructor, :foreign_key => :user_id, :class_name => 'User'
  
  has_many :users, :through => :signups

  attr_protected :is_approved
  clean_up_html [:short_description,:long_description]

end
