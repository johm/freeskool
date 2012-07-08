module ApplicationHelper
  
  def is_mine(something)
    user_signed_in? && (! something.instructor.nil?) && something.instructor.id==current_user.id
  end
  
  def taking_this(course)
    
    user_signed_in? && ! (current_user.signups.where(:course_id=>Course.find(:first)).empty?)
  end

  

end
