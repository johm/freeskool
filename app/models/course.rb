class Course < ActiveRecord::Base
  
  has_many :sessions
  has_many :locations, :through => :sessions
end
