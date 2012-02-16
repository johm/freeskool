class Location < ActiveRecord::Base
  
  has_many :sessions
  has_many :courses, :through => :sessions
  
  
  def is_available?(start_t, end_t)
    self.sessions.where{(start_time >= start_t) & (start_time <= end_t) | (end_time <= end_t) & (end_time >= start_t)}.any?
  end
  
  
end
