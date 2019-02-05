require "application_system_test_case"

class NewsSourcesTest < ApplicationSystemTestCase
  setup do
    @news_source = news_sources(:one)
  end

  test "visiting the index" do
    visit news_sources_url
    assert_selector "h1", text: "News Sources"
  end

  test "creating a News source" do
    visit news_sources_url
    click_on "New News Source"

    fill_in "Likes", with: @news_source.likes
    fill_in "Link", with: @news_source.link
    fill_in "Title", with: @news_source.title
    click_on "Create News source"

    assert_text "News source was successfully created"
    click_on "Back"
  end

  test "updating a News source" do
    visit news_sources_url
    click_on "Edit", match: :first

    fill_in "Likes", with: @news_source.likes
    fill_in "Link", with: @news_source.link
    fill_in "Title", with: @news_source.title
    click_on "Update News source"

    assert_text "News source was successfully updated"
    click_on "Back"
  end

  test "destroying a News source" do
    visit news_sources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "News source was successfully destroyed"
  end
end
