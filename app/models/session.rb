class Session < ActiveRecord::Base
  
  attr_accessible :session_start, :session_end, :course_id, :location_id
  
  scope :on_date, lambda {|d| where(:session_date => d)}
  
  belongs_to :course
  belongs_to :location
  
  before_save :set_session_date
  
  validate :session_starts_and_ends_on_same_day
  
  
  private
  
  def set_session_date
    self.session_date = session_start.to_date
  end
  
  def session_starts_and_ends_on_same_day
    unless session_start.to_date == session_end.to_date
      errors.add(:session_end, "must be the same say as session_start.")
    end
  end
end
