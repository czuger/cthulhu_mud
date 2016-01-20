require 'test_helper'

class InTheNewsHeadlinesControllerTest < ActionController::TestCase
  setup do
    @in_the_news_headline = create( :in_the_news_headline )
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:in_the_news_headlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create in_the_news_headline" do
    assert_difference('InTheNewsHeadline.count') do
      post :create, in_the_news_headline: { headline: @in_the_news_headline.headline }
    end

    assert_redirected_to in_the_news_headline_path(assigns(:in_the_news_headline))
  end

  test "should show in_the_news_headline" do
    get :show, id: @in_the_news_headline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @in_the_news_headline
    assert_response :success
  end

  test "should update in_the_news_headline" do
    patch :update, id: @in_the_news_headline, in_the_news_headline: { headline: @in_the_news_headline.headline }
    assert_redirected_to in_the_news_headline_path(assigns(:in_the_news_headline))
  end

  test "should destroy in_the_news_headline" do
    assert_difference('InTheNewsHeadline.count', -1) do
      delete :destroy, id: @in_the_news_headline
    end

    assert_redirected_to in_the_news_headlines_path
  end
end
