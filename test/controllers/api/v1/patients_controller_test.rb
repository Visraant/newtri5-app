require 'test_helper'

class Api::V1::PatientsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get check_in" do
    get :check_in
    assert_response :success
  end

end
