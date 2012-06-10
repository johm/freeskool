class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  after_create :default_role
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_and_belongs_to_many :roles
  
  has_many :signups
  has_many :courses, :inverse_of => :instructor
  has_many :registered_courses, :through => :signups, :source => :course
  
  ##
  # Roles for CanCan
  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end


  private
  def default_role  # everyone is a teacher!
    self.roles << Role.where(:name => 'Instructor').first
  end

end
