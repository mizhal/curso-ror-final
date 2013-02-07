require 'test_helper'

class AccommodationsControllerTest < ActionController::TestCase
  setup do
    @accommodation = accommodations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accommodations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accommodation" do
    assert_difference('Accommodation.count') do
      post :create, accommodation: { address: @accommodation.address, brief_description: @accommodation.brief_description, category_id: @accommodation.category_id, city: @accommodation.city, description: @accommodation.description, featured: @accommodation.featured, landlord_id: @accommodation.landlord_id, name: @accommodation.name, postal_code: @accommodation.postal_code, province_id: @accommodation.province_id, published: @accommodation.published }
    end

    assert_redirected_to accommodation_path(assigns(:accommodation))
  end

  test "should show accommodation" do
    get :show, id: @accommodation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accommodation
    assert_response :success
  end

  test "should update accommodation" do
    put :update, id: @accommodation, accommodation: { address: @accommodation.address, brief_description: @accommodation.brief_description, category_id: @accommodation.category_id, city: @accommodation.city, description: @accommodation.description, featured: @accommodation.featured, landlord_id: @accommodation.landlord_id, name: @accommodation.name, postal_code: @accommodation.postal_code, province_id: @accommodation.province_id, published: @accommodation.published }
    assert_redirected_to accommodation_path(assigns(:accommodation))
  end

  test "should destroy accommodation" do
    assert_difference('Accommodation.count', -1) do
      delete :destroy, id: @accommodation
    end

    assert_redirected_to accommodations_path
  end
end
