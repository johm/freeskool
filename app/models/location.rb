class Location < ActiveRecord::Base
  
  has_many :sessions
  has_many :courses, :through => :sessions
  
  
  
end
