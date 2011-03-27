class Member < ActiveRecord::Base
  has_many :entries
  has_many :events, :through => :entries
end
