require 'test_helper'

class SubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submission = submissions(:one)
  end

  test 'should get index' do
    get submissions_url
    assert_response :success
  end

  test 'should create submission' do
    assert_difference('Submission.count') do
      post submissions_url,
           params: { submission: { email: 'valid_email@mail.com', job_id: @submission.job.id,
                                   mobile_phone: @submission.mobile_phone, name: 'valid_name', resume: @submission.resume } }
    end
    assert_response :success
  end

  test 'should not create duped submission' do
    assert_no_difference('Submission.count') do
      post submissions_url,
           params: { submission: { email: @submission.email, job_id: @submission.job.id,
                                   mobile_phone: @submission.mobile_phone, name: @submission.name, resume: @submission.resume } }
    end
    assert_response :unprocessable_entity
  end

  test 'should show submission' do
    get submission_url(@submission)
    assert_response :success
  end

  test 'should update submission' do
    patch submission_url(@submission),
          params: { submission: { email: 'valid_email@mail.com', job_id: @submission.job.id,
                                  mobile_phone: @submission.mobile_phone, name: 'valid_name', resume: @submission.resume } }
    assert_response :success
  end

  test 'should destroy submission' do
    assert_difference('Submission.count', -1) do
      delete submission_url(@submission)
    end
  end
end
