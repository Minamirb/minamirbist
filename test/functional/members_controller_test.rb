require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should get index for pagination" do
    25.times do |i|
      Member.create(:name => "member_#{i}")
    end
    get :index
    assert_equal assigns(:members).size, 25

    get :index, :page => 1
    assert_equal assigns(:members).size, 25

    get :index, :page => 2
    assert_equal assigns(:members).size, 4

    get :index, :page => 3
    assert_blank assigns(:members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member" do
    assert_difference('Member.count') do
      post :create, :member => @member.attributes
    end

    assert_redirected_to member_path(assigns(:member))
  end

  test "should show member" do
    get :show, :id => @member.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @member.to_param
    assert_response :success
  end

  test "should update member" do
    put :update, :id => @member.to_param, :member => @member.attributes
    assert_redirected_to member_path(assigns(:member))
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete :destroy, :id => @member.to_param
    end

    assert_redirected_to members_path
  end
end
