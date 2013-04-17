class Raincheck < ActiveRecord::Base
  has_many :raincheck_users	
  has_many :users, through: :raincheck_users

  attr_accessible :completed, :description, :title
end
