class RaincheckUser < ActiveRecord::Base
  belongs_to :user, :autosave => true
  belongs_to :raincheck
  attr_accessible :user
end
