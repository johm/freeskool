class Location < ActiveRecord::Base
  
  has_many :course_sessions, :inverse_of => :location
  has_many :courses, :through => :course_sessions
  
  
  
  def is_available?(start_t, end_t)
    self.sessions.where{(start_time >= start_t) & (start_time <= end_t) | (end_time <= end_t) & (end_time >= start_t)}.any?
  end
  
  def upcoming_courses
    my_courses=courses.approved.uniq
    my_courses.find_all do |course|
      course.has_upcoming_session?
    end
  end
 
end
