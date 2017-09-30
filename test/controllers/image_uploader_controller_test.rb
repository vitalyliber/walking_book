require 'test_helper'

class ImageUploaderControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get image_uploader_create_url
    assert_response :success
  end

end
