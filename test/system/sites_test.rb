require "application_system_test_case"

class SitesTest < ApplicationSystemTestCase
  setup do
    @site = sites(:one)
  end

  test "visiting the index" do
    visit sites_url
    assert_selector "h1", text: "Sites"
  end

  test "creating a Site" do
    visit sites_url
    click_on "New Site"

    fill_in "Admin email", with: @site.admin_email
    fill_in "Favicon link", with: @site.favicon_link
    fill_in "Host", with: @site.host
    fill_in "Intro", with: @site.intro
    fill_in "Logo", with: @site.logo
    fill_in "Mailgun domain", with: @site.mailgun_domain
    fill_in "Mailgun key", with: @site.mailgun_key
    fill_in "Name", with: @site.name
    click_on "Create Site"

    assert_text "Site was successfully created"
    click_on "Back"
  end

  test "updating a Site" do
    visit sites_url
    click_on "Edit", match: :first

    fill_in "Admin email", with: @site.admin_email
    fill_in "Favicon link", with: @site.favicon_link
    fill_in "Host", with: @site.host
    fill_in "Intro", with: @site.intro
    fill_in "Logo", with: @site.logo
    fill_in "Mailgun domain", with: @site.mailgun_domain
    fill_in "Mailgun key", with: @site.mailgun_key
    fill_in "Name", with: @site.name
    click_on "Update Site"

    assert_text "Site was successfully updated"
    click_on "Back"
  end

  test "destroying a Site" do
    visit sites_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Site was successfully destroyed"
  end
end
