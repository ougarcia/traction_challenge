class Site < ActiveRecord::Base
  validates :name, presence: true
  validates :url, presence: true, uniqueness: true
  validates :ranking, presence: true, uniqueness: true
end
