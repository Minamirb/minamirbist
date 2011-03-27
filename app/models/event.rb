class Event < ActiveRecord::Base
  has_many :entries
  has_many :members, :through => :entries, :order => 'created_at ASC'
end
