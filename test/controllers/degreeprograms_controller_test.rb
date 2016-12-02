require 'test_helper'

class DegreeprogramsControllerTest < ActionController::TestCase
  setup do
    @degreeprogram = degreeprograms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:degreeprograms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create degreeprogram" do
    assert_difference('Degreeprogram.count') do
      post :create, degreeprogram: { degree_type: @degreeprogram.degree_type, discipline_id: @degreeprogram.discipline_id, name: @degreeprogram.name, subdiscipline_id: @degreeprogram.subdiscipline_id }
    end

    assert_redirected_to degreeprogram_path(assigns(:degreeprogram))
  end

  test "should show degreeprogram" do
    get :show, id: @degreeprogram
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @degreeprogram
    assert_response :success
  end

  test "should update degreeprogram" do
    patch :update, id: @degreeprogram, degreeprogram: { degree_type: @degreeprogram.degree_type, discipline_id: @degreeprogram.discipline_id, name: @degreeprogram.name, subdiscipline_id: @degreeprogram.subdiscipline_id }
    assert_redirected_to degreeprogram_path(assigns(:degreeprogram))
  end

  test "should destroy degreeprogram" do
    assert_difference('Degreeprogram.count', -1) do
      delete :destroy, id: @degreeprogram
    end

    assert_redirected_to degreeprograms_path
  end
end
