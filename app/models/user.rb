class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  # attr_accessible :title, :body

  has_many :raincheck_users	
  has_many :taken_rainchecks, :source => :raincheck, :through => :raincheck_users
  has_many :given_rainchecks, :class_name => 'Raincheck'

  def name
    "#{first_name} #{last_name}"
  end

  def generate_password
    self.password = (0...8).map{(65+rand(26)).chr}.join
  end
end
