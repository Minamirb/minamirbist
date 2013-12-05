class Member < ActiveRecord::Base
  has_many :entries
  has_many :events, :through => :entries
  paginates_per 5
end
