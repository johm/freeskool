class Course < ActiveRecord::Base
  
  
  scope :approved, where(:is_approved => true)

  scope :upcoming, joins(:course_sessions).where("course_session_start > ?",DateTime.now)
  
  has_many :course_sessions, :dependent => :destroy, :inverse_of => :course
  has_many :locations, :through => :course_sessions
  accepts_nested_attributes_for :course_sessions, :allow_destroy => true

  #these tbtested
  has_many :signups, :dependent => :destroy
  has_many :users, :through => :signups
  belongs_to :instructor, :foreign_key => :user_id, :class_name => 'User'
  

  editable_attributes = [:name,:short_description,:long_description,:course_sessions_attributes]
  attr_accessible *editable_attributes
  attr_accessible :name,:short_description,:long_description,:is_approved,:course_sessions_attributes,:user_id, :as=>:admin

  clean_up_html [:short_description,:long_description]

  
  def has_upcoming_session?
    ! (course_sessions.where("course_session_start > ?",DateTime.now).empty?)
  end


end
