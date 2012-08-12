class Signup < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  def name
    course.name
  end

end
