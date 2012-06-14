class CourseSession < ActiveRecord::Base
  
  has_event_calendar :start_at_field => 'course_session_start', :end_at_field => 'course_session_end'
  
  attr_accessible :course_session_start, :course_session_end, :course_id, :location_id, :course_session_date, :description
  
  scope :on_date, lambda {|d| where(:course_session_date => d)}
  
  belongs_to :course
  belongs_to :location
  
  #before_save :set_course_session_date
  
  validate :course_session_obeys_second_law
  validate :course_session_starts_and_ends_on_same_day
  validate :course_session_should_not_overlap_other_sessions
  
  delegate :name, :to => :course
  
  def course_session_date
    course_session_start.to_date if course_session_start
  end

  def temporally_included_sessions
    Session.where('course_session_start>= ? and course_session_end <=?',course_session_start,course_session_end).find_all {|x| x!= self}
  end

  def course_session_temporally_includes_other_session?
    ! temporally_included_sessions.empty?
  end
  
  def temporally_including_sessions
    Session.where('course_session_start<= ? and course_session_end >=?',course_session_start,course_session_end).find_all {|x| x!= self}
  end
  
  def course_session_temporally_included_in_other_session?
    ! temporally_including_sessions.empty?
  end

  def earlier_overlapping_sessions # start included in another session
    Session.where('course_session_start <= ? and course_session_end > ?',course_session_start,course_session_start).find_all {|x| x!= self}
  end

  def course_session_temporally_overlaps_earlier?
    ! earlier_overlapping_sessions.empty? 
  end

  def later_overlapping_sessions # end included in another session
    Session.where('course_session_start < ? and course_session_end >=?',course_session_end,course_session_end).find_all {|x| x!= self}
  end

  def course_session_temporally_overlaps_later?
    ! later_overlapping_sessions.empty?
  end


  def course_session_coincident_with_other_sessions?
    course_session_temporally_includes_other_session? or course_session_temporally_included_in_other_session? or course_session_temporally_overlaps_later? or course_session_temporally_overlaps_earlier?
  end

  def coincident_sessions
    temporally_included_sessions + temporally_including_sessions + earlier_overlapping_sessions + later_overlapping_sessions
  end   

  
  private
  
  #def set_course_session_date
  #  self.course_session_date = course_session_start.to_date
  #end
  


  def course_session_should_not_overlap_other_sessions
    if course_session_coincident_with_other_sessions? && ! coincident_sessions.find_all {|x| x.location=location}.empty? 
      errors.add(:course_session_start,"That session conflicts with another session in this location, please select a different date and/or time")
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
