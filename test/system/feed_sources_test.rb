require "application_system_test_case"

class FeedSourcesTest < ApplicationSystemTestCase
  setup do
    @feed_source = feed_sources(:one)
  end

  test "visiting the index" do
    visit feed_sources_url
    assert_selector "h1", text: "Feed Sources"
  end

  test "creating a Feed source" do
    visit feed_sources_url
    click_on "New Feed Source"

    fill_in "Description", with: @feed_source.description
    fill_in "Feed Type", with: @feed_source.feed_type
    fill_in "Link", with: @feed_source.link
    fill_in "Num Articles", with: @feed_source.num_articles
    fill_in "Title", with: @feed_source.title
    click_on "Create Feed source"

    assert_text "Feed source was successfully created"
    click_on "Back"
  end

  test "updating a Feed source" do
    visit feed_sources_url
    click_on "Edit", match: :first

    fill_in "Description", with: @feed_source.description
    fill_in "Feed Type", with: @feed_source.feed_type
    fill_in "Link", with: @feed_source.link
    fill_in "Num Articles", with: @feed_source.num_articles
    fill_in "Title", with: @feed_source.title
    click_on "Update Feed source"

    assert_text "Feed source was successfully updated"
    click_on "Back"
  end

  test "destroying a Feed source" do
    visit feed_sources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Feed source was successfully destroyed"
  end
end
