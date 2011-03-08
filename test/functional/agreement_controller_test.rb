require 'test_helper'

class AgreementControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
