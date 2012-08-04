module ApplicationHelper
  
  def is_mine(something)
    user_signed_in? && (! something.instructor.nil?) && something.instructor.id==current_user.id
  end
  
  def taking_this(course)
    user_signed_in? && ! (current_user.signups.where(:course_id=>course).empty?)
  end



  
  
  def parent_layout(layout)
    @view_flow.set(:layout,output_buffer)
    self.output_buffer = render(:file => "layouts/#{layout}")
  end  



end
