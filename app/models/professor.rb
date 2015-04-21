class Professor < ActiveRecord::Base
  before_save { self.netid = netid.downcase }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :netid, presence: true, uniqueness: true
  validates :department, presence: true
end
