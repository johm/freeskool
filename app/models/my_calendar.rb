class MyCalendar 
  
  def self.new(events)
    RiCal.Calendar do 
      events.each do |e|
        e.course_sessions.each do |s|
          event do
            dtstart       s.course_session_start + 5.hours - (s.course_session_start.dst? ? 0.hours : 1.hours)
            dtend         s.course_session_end + 5.hours - (s.course_session_start.dst? ? 0.hours : 1.hours)
            summary     "Freeschool: #{e.name} {'(proposed)' unless e.approved?}" + 
            description "From Freeschool"
          end
        end
      end
    end
  end
end
