class RaincheckUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :raincheck
  attr_accessible :user
end
