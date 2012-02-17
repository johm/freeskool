class Course < ActiveRecord::Base
  
  has_many :sessions
  has_many :locations, :through => :sessions

  attr_protected :is_approved
  clean_up_html [:short_description,:long_description]


end
