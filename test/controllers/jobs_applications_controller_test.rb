require "test_helper"

class JobsApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jobs_application = jobs_applications(:one)
  end

  test "should get index" do
    get jobs_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_jobs_application_url
    assert_response :success
  end

  test "should create jobs_application" do
    assert_difference('JobsApplication.count') do
      post jobs_applications_url, params: { jobs_application: { jobs_id: @jobs_application.jobs_id, status: @jobs_application.status, users_id: @jobs_application.users_id } }
    end

    assert_redirected_to jobs_application_url(JobsApplication.last)
  end

  test "should show jobs_application" do
    get jobs_application_url(@jobs_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_jobs_application_url(@jobs_application)
    assert_response :success
  end

  test "should update jobs_application" do
    patch jobs_application_url(@jobs_application), params: { jobs_application: { jobs_id: @jobs_application.jobs_id, status: @jobs_application.status, users_id: @jobs_application.users_id } }
    assert_redirected_to jobs_application_url(@jobs_application)
  end

  test "should destroy jobs_application" do
    assert_difference('JobsApplication.count', -1) do
      delete jobs_application_url(@jobs_application)
    end

    assert_redirected_to jobs_applications_url
  end
end
