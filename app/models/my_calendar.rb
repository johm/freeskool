class MyCalendar 
  
  def self.new(events)
    RiCal.Calendar do 
      events.each do |e|
        e.course_sessions.each do |s|
          event do
            dtstart       s.course_session_start + 5.hours - (s.course_session_start.dst? ? 1.hour : 0.hours)
            dtend         s.course_session_end + 5.hours - (s.course_session_start.dst? ? 1.hour : 0.hours)
            summary     "Freeschool: #{e.name}"
            description "From Freeschool"
          end
        end
      end
    end
  end
end
