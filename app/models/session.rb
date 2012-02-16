class Session < ActiveRecord::Base
  belongs_to :course
  belongs_to :location
  
  validates :times_on_given_day
  
  
  
  
  def times_on_given_day
    if session_start.to_date != session_date
      errors.add(:session_start, "must be on the same day as session_date")
    elsif session_end.to_date != session_date
      errors.add(:session_end, "must be on the same day as session_date")
    end
  end
end
