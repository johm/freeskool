class Session < ActiveRecord::Base
  
  has_event_calendar :start_at_field => 'session_start', :end_at_field => 'session_end'
  
  attr_accessible :session_start, :session_end, :course_id, :location_id, :session_date, :description
  
  scope :on_date, lambda {|d| where(:session_date => d)}
  
  belongs_to :course
  belongs_to :location
  
  #before_save :set_session_date
  
  validate :session_obeys_second_law
  validate :session_starts_and_ends_on_same_day
  validate :session_should_not_overlap_other_sessions
  
  delegate :name, :to => :course
  
  def session_date
    session_start.to_date if session_start
  end

  def temporally_included_sessions
    Session.where('session_start>= ? and session_end <=?',session_start,session_end).find_all {|x| x!= self}
  end

  def session_temporally_includes_other_session?
    ! temporally_included_sessions.empty?
  end
  
  def temporally_including_sessions
    Session.where('session_start<= ? and session_end >=?',session_start,session_end).find_all {|x| x!= self}
  end
  
  def session_temporally_included_in_other_session?
    ! temporally_including_sessions.empty?
  end

  def earlier_overlapping_sessions # start included in another session
    Session.where('session_start <= ? and session_end > ?',session_start,session_start).find_all {|x| x!= self}
  end

  def session_temporally_overlaps_earlier?
    ! earlier_overlapping_sessions.empty? 
  end

  def later_overlapping_sessions # end included in another session
    Session.where('session_start < ? and session_end >=?',session_end,session_end).find_all {|x| x!= self}
  end

  def session_temporally_overlaps_later?
    ! later_overlapping_sessions.empty?
  end


  def session_coincident_with_other_sessions?
    session_temporally_includes_other_session? or session_temporally_included_in_other_session? or session_temporally_overlaps_later? or session_temporally_overlaps_earlier?
  end

  def coincident_sessions
    temporally_included_sessions + temporally_including_sessions + earlier_overlapping_sessions + later_overlapping_sessions
  end   

  
  private
  
  #def set_session_date
  #  self.session_date = session_start.to_date
  #end
  


  def session_should_not_overlap_other_sessions
    if session_coincident_with_other_sessions? && ! coincident_sessions.find_all {|x| x.location=location}.empty? 
      errors.add(:session_start,"That session conflicts with another session in this location, please select a different date and/or time")
    end
  end

  def session_obeys_second_law
    unless session_start < session_end
      errors.add(:session_end, "must be later than session_start.")
    end
  end
  

  def session_starts_and_ends_on_same_day
    unless session_start.to_date == session_end.to_date
      errors.add(:session_end, "must be the same day as session_start.")
    end
  end
end
