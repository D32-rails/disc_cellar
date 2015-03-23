require "test_helper"

class DvdsControllerTest < ActionController::TestCase

  def dvd
    @dvd ||= dvds :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:dvds)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Dvd.count') do
      post :create, dvd: { genre: dvd.genre, published: dvd.published, rated: dvd.rated, year: dvd.year }
    end

    assert_redirected_to dvd_path(assigns(:dvd))
  end

  def test_show
    get :show, id: dvd
    assert_response :success
  end

  def test_edit
    get :edit, id: dvd
    assert_response :success
  end

  def test_update
    put :update, id: dvd, dvd: { genre: dvd.genre, published: dvd.published, rated: dvd.rated, year: dvd.year }
    assert_redirected_to dvd_path(assigns(:dvd))
  end

  def test_destroy
    assert_difference('Dvd.count', -1) do
      delete :destroy, id: dvd
    end

    assert_redirected_to dvds_path
  end
end
