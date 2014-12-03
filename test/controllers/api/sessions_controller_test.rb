require 'test_helper'

class Api::SessionsControllerTest < ActionController::TestCase
  test "should get logout" do
    delete :destroy
    assert_response :success
  end

  test "should post create - success" do
  	User.create({email: 'j@j.com', name: 'joe', password: '123456'})
    post :create, {email: 'j@j.com', password: '123456'}
    assert_response :success
  end

test "should post create - failure" do
  	User.create({email: 'j@j.com', name: 'joe', password: '123456'})
    post :create, {email: 'x@x.com', password: '123456'}
    assert response.status == 400
    assert response.body
  end

end
