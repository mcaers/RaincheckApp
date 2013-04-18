class Raincheck < ActiveRecord::Base
  

  has_many :raincheck_users	
  has_many :takers, :source => :user, through: :raincheck_users
  belongs_to :giver, :class_name => 'User', :foreign_key => 'user_id'

  attr_accessible :completed, :description, :title

 
  validates :title, presence: true, length: {maximum: 100}
  validates :description, presence: true, length: {maximum: 140}
end
