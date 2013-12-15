class MyCalendar 
  
  def self.new(events)
    RiCal.Calendar do 
      events.each do |e|
        e.sessions.each do |s|
          event do
            dtstart       s.course_session_start + 5.hours
            dtend         s.course_session_end + 5.hours
            summary     "Freeschool: #{e.name}"
            description "From Freeschool"
          end
        end
      end
    end
  end
end
