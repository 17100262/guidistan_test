require 'test_helper'

class SubdisciplinesControllerTest < ActionController::TestCase
  setup do
    @subdiscipline = subdisciplines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subdisciplines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subdiscipline" do
    assert_difference('Subdiscipline.count') do
      post :create, subdiscipline: { description: @subdiscipline.description, discipline_id: @subdiscipline.discipline_id, name: @subdiscipline.name }
    end

    assert_redirected_to subdiscipline_path(assigns(:subdiscipline))
  end

  test "should show subdiscipline" do
    get :show, id: @subdiscipline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subdiscipline
    assert_response :success
  end

  test "should update subdiscipline" do
    patch :update, id: @subdiscipline, subdiscipline: { description: @subdiscipline.description, discipline_id: @subdiscipline.discipline_id, name: @subdiscipline.name }
    assert_redirected_to subdiscipline_path(assigns(:subdiscipline))
  end

  test "should destroy subdiscipline" do
    assert_difference('Subdiscipline.count', -1) do
      delete :destroy, id: @subdiscipline
    end

    assert_redirected_to subdisciplines_path
  end
end
