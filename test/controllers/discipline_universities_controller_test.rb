require 'test_helper'

class DisciplineUniversitiesControllerTest < ActionController::TestCase
  setup do
    @discipline_university = discipline_universities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discipline_universities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discipline_university" do
    assert_difference('DisciplineUniversity.count') do
      post :create, discipline_university: { degreeprogram_id: @discipline_university.degreeprogram_id, discipline_id: @discipline_university.discipline_id, subdiscipline_id: @discipline_university.subdiscipline_id, university_id: @discipline_university.university_id }
    end

    assert_redirected_to discipline_university_path(assigns(:discipline_university))
  end

  test "should show discipline_university" do
    get :show, id: @discipline_university
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discipline_university
    assert_response :success
  end

  test "should update discipline_university" do
    patch :update, id: @discipline_university, discipline_university: { degreeprogram_id: @discipline_university.degreeprogram_id, discipline_id: @discipline_university.discipline_id, subdiscipline_id: @discipline_university.subdiscipline_id, university_id: @discipline_university.university_id }
    assert_redirected_to discipline_university_path(assigns(:discipline_university))
  end

  test "should destroy discipline_university" do
    assert_difference('DisciplineUniversity.count', -1) do
      delete :destroy, id: @discipline_university
    end

    assert_redirected_to discipline_universities_path
  end
end
