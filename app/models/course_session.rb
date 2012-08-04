class CourseSession < ActiveRecord::Base
  
  
  has_event_calendar :start_at_field => 'course_session_start', :end_at_field => 'course_session_end'
  
  attr_accessible :course_session_start, :course_session_end, :course_id, :location_id,  :description
  attr_accessible :course_session_start, :course_session_end, :course_id, :location_id,  :description, :as => :admin
  
  clean_up_html [:description]

# scope :on_date, lambda {|d| where(:course_session_date => d)}
  
  belongs_to :course, :inverse_of => :course_sessions
  belongs_to :location, :inverse_of => :course_sessions
  
  #before_save :set_course_session_date
  
  validate :course_session_obeys_second_law
  validate :course_session_starts_and_ends_on_same_day
  validate :course_session_should_not_overlap_other_sessions

#  delegate :name, :to => :course
  
  def course_session_date
    course_session_start.to_date if course_session_start
  end

  def course_session_start_hour
    course_session_start.to_time.strftime("%H") if course_session_start
  end

  def course_session_start_minutes
    course_session_start.to_time.strftime("%M") if course_session_start
  end

  def course_session_end_hour
    course_session_end.to_time.strftime("%H") if course_session_end
  end

  def course_session_end_minutes
    course_session_end.to_time.strftime("%M") if course_session_end
  end

  
  def overlapping_sessions #tk add location
    CourseSession.find_by_sql ["SELECT * from course_sessions where id!=? AND location_id=? AND NOT(? >= course_session_end OR ? <= course_session_start) ", id,location_id,course_session_start,course_session_end] 
  end

  def name 
    course_session_start.to_date if course_session_start
  end
  
  private
  
  #def set_course_session_date
  #  self.course_session_date = course_session_start.to_date
  #end
  


  def course_session_should_not_overlap_other_sessions
    if !overlapping_sessions.empty?
      errors.add(:course_session_start_hour, "There is already a session scheduled here at that time!")
    end
  end

  def course_session_obeys_second_law
    unless course_session_start < course_session_end
      errors.add(:course_session_end, "must be later than course_session_start.")
    end
  end
  
  def course_session_starts_and_ends_on_same_day
    unless course_session_start.to_date == course_session_end.to_date
      errors.add(:course_session_end, "must be the same day as course_session_start.")
    end
  end
end
