class Raincheck < ActiveRecord::Base
  before_create :set_owner

  has_many :raincheck_users	
  has_many :users, through: :raincheck_users
  belongs_to :owner, :class_name => 'User', :foreign_key => 'user_id'

  attr_accessible :completed, :description, :title

  def set_owner
  	# only happens when a raincheck is CREATED, not updated
  	# set the owner to the user who created this, probably current_user
  	self.owner = current_user
  end
end
