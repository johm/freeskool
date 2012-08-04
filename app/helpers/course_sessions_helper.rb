module CourseSessionsHelper


def reasonable_hours
  [["7 AM","07"],
   ["8 AM","08"],
   ["9 AM","09"],
   ["10 AM","10"],
   ["11 AM","11"],
   ["12 PM","12"],
   ["1 PM","13"],
   ["2 PM","14"],
   ["3 PM","15"],
   ["4 PM","16"],
   ["5 PM","17"],
   ["6 PM","18"],
   ["7 PM","19"],
   ["8 PM","20"],
   ["9 PM","21"],
   ["10 PM","22"]]
end

def compact_readable(cs)
  cs.course_session_start.strftime("%A, %B %d#{", %Y" if cs.course_session_start.year != Date.today.year} @ %l:%M %p") 
end


end
