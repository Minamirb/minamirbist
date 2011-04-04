# coding: UTF-8
class Entry < ActiveRecord::Base
  belongs_to :member
  belongs_to :event
  validates_uniqueness_of :event_id, :member_id, :on => :create
end
