require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Jobs"
  end

  test "should create job" do
    visit jobs_url
    click_on "New job"

    fill_in "Description", with: @job.description
    fill_in "End date", with: @job.end_date
    fill_in "Recruiter id", with: @job.recruiter_id_id
    fill_in "Skills", with: @job.skills
    fill_in "Start date", with: @job.start_date
    check "Status" if @job.status
    fill_in "Title", with: @job.title
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "should update Job" do
    visit job_url(@job)
    click_on "Edit this job", match: :first

    fill_in "Description", with: @job.description
    fill_in "End date", with: @job.end_date
    fill_in "Recruiter id", with: @job.recruiter_id_id
    fill_in "Skills", with: @job.skills
    fill_in "Start date", with: @job.start_date
    check "Status" if @job.status
    fill_in "Title", with: @job.title
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "should destroy Job" do
    visit job_url(@job)
    click_on "Destroy this job", match: :first

    assert_text "Job was successfully destroyed"
  end
end
