require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:one)
  end

  test 'should get index' do
    get jobs_url
    assert_response :success
  end

  test 'should create job' do
    assert_difference('Job.count') do
      post jobs_url,
           params: { job: { description: @job.description, end_date: @job.end_date, recruiter_id: @job.recruiter.id,
                            skills: @job.skills, start_date: @job.start_date, status: @job.status, title: @job.title } }
    end
  end

  test 'should show job' do
    get job_url(@job)
    assert_response :success
  end

  test 'should update job' do
    patch job_url(@job),
          params: { job: { description: @job.description, end_date: @job.end_date, recruiter_id: @job.recruiter.id,
                           skills: @job.skills, start_date: @job.start_date, status: @job.status, title: @job.title } }

    assert_response :success
  end

  test 'should destroy job' do
    assert_difference('Job.count', -1) do
      delete job_url(@job)
    end
  end
end
