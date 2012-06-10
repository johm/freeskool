##
# Roles for CanCan authorization. 
# Roles should probably include Admin, Instructor, Student, more as needed.

class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :roles_users

  
end
