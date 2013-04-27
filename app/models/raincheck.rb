class Raincheck < ActiveRecord::Base
  

  has_many :raincheck_users, :autosave => true
  has_many :takers, :source => :user, through: :raincheck_users
  belongs_to :giver, :class_name => 'User', :foreign_key => 'user_id'

  attr_accessible :completed, :description, :title, :takers_emails
  accepts_nested_attributes_for :takers
 
  validates :title, presence: true, length: {maximum: 100}
  validates :description, presence: true, length: {maximum: 140}

  attr_accessor :takers_emails

  after_save :send_email

  def takers_emails()
  	emails = []
  	takers.each do |taker|
  		emails << taker.email
  	end
  	return emails.join(", ")
  end

  private

  def send_email
    return unless new_record?
    @takers_emails.split(",").each do |email|
      u = User.where(:email => email.strip).first_or_initialize()
      if u.new_record?
        password = u.generate_password
        u.save!
        UserMailer.new_notice(u, self, password).deliver
      end
      raincheck_users.where(user_id: u.id, raincheck_id: self.id).first_or_create!()
    end
  end
end

