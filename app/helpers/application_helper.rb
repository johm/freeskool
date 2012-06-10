module ApplicationHelper
  def is_mine(something)
    user_signed_in? && something.instructor.id==current_user.id
  end
end
