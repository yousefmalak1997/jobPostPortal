require "application_system_test_case"

class JobsApplicationsTest < ApplicationSystemTestCase
  setup do
    @jobs_application = jobs_applications(:one)
  end

  test "visiting the index" do
    visit jobs_applications_url
    assert_selector "h1", text: "Jobs Applications"
  end

  test "creating a Jobs application" do
    visit jobs_applications_url
    click_on "New Jobs Application"

    fill_in "Jobs", with: @jobs_application.jobs_id
    fill_in "Status", with: @jobs_application.status
    fill_in "Users", with: @jobs_application.users_id
    click_on "Create Jobs application"

    assert_text "Jobs application was successfully created"
    click_on "Back"
  end

  test "updating a Jobs application" do
    visit jobs_applications_url
    click_on "Edit", match: :first

    fill_in "Jobs", with: @jobs_application.jobs_id
    fill_in "Status", with: @jobs_application.status
    fill_in "Users", with: @jobs_application.users_id
    click_on "Update Jobs application"

    assert_text "Jobs application was successfully updated"
    click_on "Back"
  end

  test "destroying a Jobs application" do
    visit jobs_applications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Jobs application was successfully destroyed"
  end
end
