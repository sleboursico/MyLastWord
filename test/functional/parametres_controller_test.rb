require 'test_helper'

class ParametresControllerTest < ActionController::TestCase
  setup do
    @parametre = parametres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parametres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parametre" do
    assert_difference('Parametre.count') do
      post :create, parametre: { derniereDateValidation: @parametre.derniereDateValidation, facebook: @parametre.facebook, frequence_cd: @parametre.frequence_cd, twitter: @parametre.twitter }
    end

    assert_redirected_to parametre_path(assigns(:parametre))
  end

  test "should show parametre" do
    get :show, id: @parametre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parametre
    assert_response :success
  end

  test "should update parametre" do
    put :update, id: @parametre, parametre: { derniereDateValidation: @parametre.derniereDateValidation, facebook: @parametre.facebook, frequence_cd: @parametre.frequence_cd, twitter: @parametre.twitter }
    assert_redirected_to parametre_path(assigns(:parametre))
  end

  test "should destroy parametre" do
    assert_difference('Parametre.count', -1) do
      delete :destroy, id: @parametre
    end

    assert_redirected_to parametres_path
  end
end
