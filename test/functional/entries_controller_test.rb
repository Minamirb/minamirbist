require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  setup do
    @entry = entries(:one)
  end

  test "should get index" do
    assert_raises ActionController::RoutingError do
      get :index
    end
  end

  test "should get new" do
    get :new, :event_id => events(:fifth).id
    assert_response :success
  end

  test "should create entry" do
    assert_difference('Entry.count') do
      post :create, :entry => @entry.attributes, :event_id => entries(:two).event_id
    end

    assert_redirected_to event_path Event.find(entries(:two).event_id)
  end

  test "should show entry" do
    assert_raises ActionController::RoutingError do
      get :show, :id => @entry.to_param
    end
  end

  test "should get edit" do
    assert_raises ActionController::RoutingError do
      get :edit, :id => @entry.to_param, :event_id => @entry.event_id
    end
  end

  test "should update entry" do
    assert_raises ActionController::RoutingError do
      put :update, :id => @entry.to_param, :entry => @entry.attributes
    end
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete :destroy, :id => @entry.to_param, :event_id => @entry.event
    end

    assert_redirected_to event_path @entry.event
  end
end
