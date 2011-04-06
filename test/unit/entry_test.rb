require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "create a entry" do
    ent = Entry.new(:event_id => 999, :member_id =>999)
    assert ent.save
  end

  test "cannot entry twice" do
    Entry.create(:event_id => 1, :member_id => 2)
    ent = Entry.new(:event_id => 1, :member_id => 2)
    assert !ent.valid?
  end
end
