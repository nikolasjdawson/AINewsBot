require "application_system_test_case"

class PostCategoriesTest < ApplicationSystemTestCase
  setup do
    @post_category = post_categories(:one)
  end

  test "visiting the index" do
    visit post_categories_url
    assert_selector "h1", text: "Post Categories"
  end

  test "creating a Post category" do
    visit post_categories_url
    click_on "New Post Category"

    fill_in "Name", with: @post_category.name
    click_on "Create Post category"

    assert_text "Post category was successfully created"
    click_on "Back"
  end

  test "updating a Post category" do
    visit post_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @post_category.name
    click_on "Update Post category"

    assert_text "Post category was successfully updated"
    click_on "Back"
  end

  test "destroying a Post category" do
    visit post_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post category was successfully destroyed"
  end
end
