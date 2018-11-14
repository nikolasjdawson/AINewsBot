require 'test_helper'

class FeedSourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feed_source = feed_sources(:one)
  end

  test "should get index" do
    get feed_sources_url
    assert_response :success
  end

  test "should get new" do
    get new_feed_source_url
    assert_response :success
  end

  test "should create feed_source" do
    assert_difference('FeedSource.count') do
      post feed_sources_url, params: { feed_source: { description: @feed_source.description, feed_type: @feed_source.feed_type, link: @feed_source.link, num_articles: @feed_source.num_articles, title: @feed_source.title } }
    end

    assert_redirected_to feed_source_url(FeedSource.last)
  end

  test "should show feed_source" do
    get feed_source_url(@feed_source)
    assert_response :success
  end

  test "should get edit" do
    get edit_feed_source_url(@feed_source)
    assert_response :success
  end

  test "should update feed_source" do
    patch feed_source_url(@feed_source), params: { feed_source: { description: @feed_source.description, feed_type: @feed_source.feed_type, link: @feed_source.link, num_articles: @feed_source.num_articles, title: @feed_source.title } }
    assert_redirected_to feed_source_url(@feed_source)
  end

  test "should destroy feed_source" do
    assert_difference('FeedSource.count', -1) do
      delete feed_source_url(@feed_source)
    end

    assert_redirected_to feed_sources_url
  end
end
