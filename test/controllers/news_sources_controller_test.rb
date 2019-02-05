require 'test_helper'

class NewsSourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @news_source = news_sources(:one)
  end

  test "should get index" do
    get news_sources_url
    assert_response :success
  end

  test "should get new" do
    get new_news_source_url
    assert_response :success
  end

  test "should create news_source" do
    assert_difference('NewsSource.count') do
      post news_sources_url, params: { news_source: { likes: @news_source.likes, link: @news_source.link, title: @news_source.title } }
    end

    assert_redirected_to news_source_url(NewsSource.last)
  end

  test "should show news_source" do
    get news_source_url(@news_source)
    assert_response :success
  end

  test "should get edit" do
    get edit_news_source_url(@news_source)
    assert_response :success
  end

  test "should update news_source" do
    patch news_source_url(@news_source), params: { news_source: { likes: @news_source.likes, link: @news_source.link, title: @news_source.title } }
    assert_redirected_to news_source_url(@news_source)
  end

  test "should destroy news_source" do
    assert_difference('NewsSource.count', -1) do
      delete news_source_url(@news_source)
    end

    assert_redirected_to news_sources_url
  end
end
