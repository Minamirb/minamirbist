# coding: UTF-8
class Entry < ActiveRecord::Base
  belongs_to :member
  belongs_to :event
  validates_uniqueness_of :member_id, :scope =>[:event_id],
                          :message => '既に登録済です。'
end
